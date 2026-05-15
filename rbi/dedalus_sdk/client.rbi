# typed: strong

module DedalusSDK
  class Client < DedalusSDK::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    ENVIRONMENTS =
      T.let(
        {
          production: "https://api.dedaluslabs.ai",
          development: "http://localhost:4010"
        },
        T::Hash[Symbol, String]
      )

    # API key for Bearer token authentication.
    sig { returns(T.nilable(String)) }
    attr_reader :api_key

    # API key for X-API-Key header authentication.
    sig { returns(T.nilable(String)) }
    attr_reader :x_api_key

    # MCP Authorization Server URL
    sig { returns(T.nilable(String)) }
    attr_reader :as_base_url

    # Organization ID for request scoping.
    sig { returns(T.nilable(String)) }
    attr_reader :dedalus_org_id

    # Provider name for BYOK mode (e.g., 'google', 'openai', 'anthropic').
    sig { returns(T.nilable(String)) }
    attr_reader :provider

    # Provider API key for BYOK mode.
    sig { returns(T.nilable(String)) }
    attr_reader :provider_key

    # Model identifier for BYOK provider.
    sig { returns(T.nilable(String)) }
    attr_reader :provider_model

    sig { returns(DedalusSDK::Resources::Models) }
    attr_reader :models

    sig { returns(DedalusSDK::Resources::Embeddings) }
    attr_reader :embeddings

    sig { returns(DedalusSDK::Resources::Audio) }
    attr_reader :audio

    sig { returns(DedalusSDK::Resources::Images) }
    attr_reader :images

    sig { returns(DedalusSDK::Resources::OCR) }
    attr_reader :ocr

    sig { returns(DedalusSDK::Resources::Responses) }
    attr_reader :responses

    sig { returns(DedalusSDK::Resources::Chat) }
    attr_reader :chat

    # @api private
    sig { override.returns(T::Hash[String, String]) }
    private def auth_headers
    end

    # @api private
    sig { returns(T::Hash[String, String]) }
    private def bearer
    end

    # @api private
    sig { returns(T::Hash[String, String]) }
    private def api_key_auth
    end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        api_key: T.nilable(String),
        x_api_key: T.nilable(String),
        as_base_url: T.nilable(String),
        dedalus_org_id: T.nilable(String),
        provider: T.nilable(String),
        provider_key: T.nilable(String),
        provider_model: T.nilable(String),
        environment: T.nilable(T.any(Symbol, String)),
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float,
        idempotency_header: String
      ).returns(T.attached_class)
    end
    def self.new(
      # API key for Bearer token authentication. Defaults to `ENV["DEDALUS_API_KEY"]`
      api_key: ENV["DEDALUS_API_KEY"],
      # API key for X-API-Key header authentication. Defaults to
      # `ENV["DEDALUS_X_API_KEY"]`
      x_api_key: ENV["DEDALUS_X_API_KEY"],
      # MCP Authorization Server URL Defaults to `ENV["DEDALUS_AS_URL"]`
      as_base_url: ENV.fetch("DEDALUS_AS_URL", "https://as.dedaluslabs.ai"),
      # Organization ID for request scoping. Defaults to `ENV["DEDALUS_ORG_ID"]`
      dedalus_org_id: ENV["DEDALUS_ORG_ID"],
      # Provider name for BYOK mode (e.g., 'google', 'openai', 'anthropic'). Defaults to
      # `ENV["DEDALUS_PROVIDER"]`
      provider: ENV["DEDALUS_PROVIDER"],
      # Provider API key for BYOK mode. Defaults to `ENV["DEDALUS_PROVIDER_KEY"]`
      provider_key: ENV["DEDALUS_PROVIDER_KEY"],
      # Model identifier for BYOK provider. Defaults to `ENV["DEDALUS_PROVIDER_MODEL"]`
      provider_model: ENV["DEDALUS_PROVIDER_MODEL"],
      # Specifies the environment to use for the API.
      #
      # Each environment maps to a different base URL:
      #
      # - `production` corresponds to `https://api.dedaluslabs.ai`
      # - `development` corresponds to `http://localhost:4010`
      environment: nil,
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["DEDALUS_BASE_URL"]`
      base_url: ENV["DEDALUS_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: DedalusSDK::Client::DEFAULT_MAX_RETRIES,
      timeout: DedalusSDK::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: DedalusSDK::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: DedalusSDK::Client::DEFAULT_MAX_RETRY_DELAY,
      idempotency_header: "Idempotency-Key"
    )
    end
  end
end
