# frozen_string_literal: true

module DedalusSDK
  class Client < DedalusSDK::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # rubocop:disable Style/MutableConstant
    # @type [Hash{Symbol=>String}]
    ENVIRONMENTS = {production: "https://api.dedaluslabs.ai", development: "http://localhost:4010"}
    # rubocop:enable Style/MutableConstant

    # API key for Bearer token authentication.
    # @return [String, nil]
    attr_reader :api_key

    # API key for X-API-Key header authentication.
    # @return [String, nil]
    attr_reader :x_api_key

    # MCP Authorization Server URL
    # @return [String, nil]
    attr_reader :as_base_url

    # Organization ID for request scoping.
    # @return [String, nil]
    attr_reader :dedalus_org_id

    # Provider name for BYOK mode (e.g., 'google', 'openai', 'anthropic').
    # @return [String, nil]
    attr_reader :provider

    # Provider API key for BYOK mode.
    # @return [String, nil]
    attr_reader :provider_key

    # Model identifier for BYOK provider.
    # @return [String, nil]
    attr_reader :provider_model

    # @return [DedalusSDK::Resources::Models]
    attr_reader :models

    # @return [DedalusSDK::Resources::Embeddings]
    attr_reader :embeddings

    # @return [DedalusSDK::Resources::Audio]
    attr_reader :audio

    # @return [DedalusSDK::Resources::Images]
    attr_reader :images

    # @return [DedalusSDK::Resources::OCR]
    attr_reader :ocr

    # @return [DedalusSDK::Resources::Responses]
    attr_reader :responses

    # @return [DedalusSDK::Resources::Chat]
    attr_reader :chat

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_headers
      {**bearer, **api_key_auth}
    end

    # @api private
    #
    # @return [Hash{String=>String}]
    private def bearer
      return {} if @api_key.nil?

      {"authorization" => "Bearer #{@api_key}"}
    end

    # @api private
    #
    # @return [Hash{String=>String}]
    private def api_key_auth
      {"x-api-key" => @x_api_key}
    end

    # Creates and returns a new client for interacting with the API.
    #
    # @param api_key [String, nil] API key for Bearer token authentication. Defaults to `ENV["DEDALUS_API_KEY"]`
    #
    # @param x_api_key [String, nil] API key for X-API-Key header authentication. Defaults to
    # `ENV["DEDALUS_X_API_KEY"]`
    #
    # @param as_base_url [String, nil] MCP Authorization Server URL Defaults to `ENV["DEDALUS_AS_URL"]`
    #
    # @param dedalus_org_id [String, nil] Organization ID for request scoping. Defaults to `ENV["DEDALUS_ORG_ID"]`
    #
    # @param provider [String, nil] Provider name for BYOK mode (e.g., 'google', 'openai', 'anthropic'). Defaults to
    # `ENV["DEDALUS_PROVIDER"]`
    #
    # @param provider_key [String, nil] Provider API key for BYOK mode. Defaults to `ENV["DEDALUS_PROVIDER_KEY"]`
    #
    # @param provider_model [String, nil] Model identifier for BYOK provider. Defaults to `ENV["DEDALUS_PROVIDER_MODEL"]`
    #
    # @param environment [:production, :development, nil] Specifies the environment to use for the API.
    #
    # Each environment maps to a different base URL:
    #
    # - `production` corresponds to `https://api.dedaluslabs.ai`
    # - `development` corresponds to `http://localhost:4010`
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    # `"https://api.example.com/v2/"`. Defaults to `ENV["DEDALUS_BASE_URL"]`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    #
    # @param idempotency_header [String]
    def initialize(
      api_key: ENV["DEDALUS_API_KEY"],
      x_api_key: ENV["DEDALUS_X_API_KEY"],
      as_base_url: ENV.fetch("DEDALUS_AS_URL", "https://as.dedaluslabs.ai"),
      dedalus_org_id: ENV["DEDALUS_ORG_ID"],
      provider: ENV["DEDALUS_PROVIDER"],
      provider_key: ENV["DEDALUS_PROVIDER_KEY"],
      provider_model: ENV["DEDALUS_PROVIDER_MODEL"],
      environment: nil,
      base_url: ENV["DEDALUS_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY,
      idempotency_header: "Idempotency-Key"
    )
      base_url ||= DedalusSDK::Client::ENVIRONMENTS.fetch(environment&.to_sym || :production) do
        message = "environment must be one of #{DedalusSDK::Client::ENVIRONMENTS.keys}, got #{environment}"
        raise ArgumentError.new(message)
      end

      headers = {
        "user-agent" => "Dedalus-SDK",
        "x-sdk-version" => "1.0.0",
        "x-provider" => (@provider = provider&.to_s),
        "x-provider-key" => (@provider_key = provider_key&.to_s),
        "x-provider-model" => (@provider_model = provider_model&.to_s)
      }
      custom_headers_env = ENV["DEDALUS_CUSTOM_HEADERS"]
      unless custom_headers_env.nil?
        parsed = {}
        custom_headers_env.split("\n").each do |line|
          colon = line.index(":")
          unless colon.nil?
            parsed[line[0...colon].strip] = line[(colon + 1)..].strip
          end
        end
        headers = parsed.merge(headers)
      end

      @api_key = api_key&.to_s
      @x_api_key = x_api_key&.to_s
      @as_base_url = as_base_url.to_s
      @dedalus_org_id = dedalus_org_id&.to_s

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay,
        headers: headers,
        idempotency_header: idempotency_header
      )

      @models = DedalusSDK::Resources::Models.new(client: self)
      @embeddings = DedalusSDK::Resources::Embeddings.new(client: self)
      @audio = DedalusSDK::Resources::Audio.new(client: self)
      @images = DedalusSDK::Resources::Images.new(client: self)
      @ocr = DedalusSDK::Resources::OCR.new(client: self)
      @responses = DedalusSDK::Resources::Responses.new(client: self)
      @chat = DedalusSDK::Resources::Chat.new(client: self)
    end
  end
end
