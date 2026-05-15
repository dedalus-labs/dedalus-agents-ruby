# frozen_string_literal: true

module DedalusSDK
  module Models
    # @see DedalusSDK::Resources::Models#retrieve
    class Model < DedalusSDK::Internal::Type::BaseModel
      # @!attribute id
      #   Unique model identifier with provider prefix (e.g., 'openai/gpt-4')
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   When the model was released (RFC 3339)
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute provider
      #   Provider that hosts this model
      #
      #   @return [Symbol, DedalusSDK::Models::Model::Provider]
      required :provider, enum: -> { DedalusSDK::Model::Provider }

      # @!attribute capabilities
      #   Normalized model capabilities across all providers.
      #
      #   @return [DedalusSDK::Models::Model::Capabilities, nil]
      optional :capabilities, -> { DedalusSDK::Model::Capabilities }, nil?: true

      # @!attribute defaults
      #   Provider-declared default parameters for model generation.
      #
      #   @return [DedalusSDK::Models::Model::Defaults, nil]
      optional :defaults, -> { DedalusSDK::Model::Defaults }, nil?: true

      # @!attribute description
      #   Model description
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute display_name
      #   Human-readable model name
      #
      #   @return [String, nil]
      optional :display_name, String, nil?: true

      # @!attribute provider_declared_generation_methods
      #   Provider-specific generation method names (None = not declared)
      #
      #   @return [Array<String>, nil]
      optional :provider_declared_generation_methods, DedalusSDK::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute provider_info
      #   Raw provider-specific metadata
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :provider_info,
               DedalusSDK::Internal::Type::HashOf[DedalusSDK::Internal::Type::Unknown],
               nil?: true

      # @!attribute version
      #   Model version identifier
      #
      #   @return [String, nil]
      optional :version, String, nil?: true

      # @!method initialize(id:, created_at:, provider:, capabilities: nil, defaults: nil, description: nil, display_name: nil, provider_declared_generation_methods: nil, provider_info: nil, version: nil)
      #   Unified model metadata across all providers.
      #
      #   Combines provider-specific schemas into a single, consistent format. Fields that
      #   aren't available from a provider are set to None.
      #
      #   @param id [String] Unique model identifier with provider prefix (e.g., 'openai/gpt-4')
      #
      #   @param created_at [Time] When the model was released (RFC 3339)
      #
      #   @param provider [Symbol, DedalusSDK::Models::Model::Provider] Provider that hosts this model
      #
      #   @param capabilities [DedalusSDK::Models::Model::Capabilities, nil] Normalized model capabilities across all providers.
      #
      #   @param defaults [DedalusSDK::Models::Model::Defaults, nil] Provider-declared default parameters for model generation.
      #
      #   @param description [String, nil] Model description
      #
      #   @param display_name [String, nil] Human-readable model name
      #
      #   @param provider_declared_generation_methods [Array<String>, nil] Provider-specific generation method names (None = not declared)
      #
      #   @param provider_info [Hash{Symbol=>Object}, nil] Raw provider-specific metadata
      #
      #   @param version [String, nil] Model version identifier

      # Provider that hosts this model
      #
      # @see DedalusSDK::Models::Model#provider
      module Provider
        extend DedalusSDK::Internal::Type::Enum

        OPENAI = :openai
        ANTHROPIC = :anthropic
        GOOGLE = :google
        XAI = :xai
        MISTRAL = :mistral
        GROQ = :groq
        FIREWORKS = :fireworks
        DEEPSEEK = :deepseek
        MOONSHOT = :moonshot
        CEREBRAS = :cerebras

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see DedalusSDK::Models::Model#capabilities
      class Capabilities < DedalusSDK::Internal::Type::BaseModel
        # @!attribute audio
        #   Supports audio processing
        #
        #   @return [Boolean, nil]
        optional :audio, DedalusSDK::Internal::Type::Boolean, nil?: true

        # @!attribute image_generation
        #   Supports image generation
        #
        #   @return [Boolean, nil]
        optional :image_generation, DedalusSDK::Internal::Type::Boolean, nil?: true

        # @!attribute input_token_limit
        #   Maximum input tokens
        #
        #   @return [Integer, nil]
        optional :input_token_limit, Integer, nil?: true

        # @!attribute output_token_limit
        #   Maximum output tokens
        #
        #   @return [Integer, nil]
        optional :output_token_limit, Integer, nil?: true

        # @!attribute streaming
        #   Supports streaming responses
        #
        #   @return [Boolean, nil]
        optional :streaming, DedalusSDK::Internal::Type::Boolean, nil?: true

        # @!attribute structured_output
        #   Supports structured JSON output
        #
        #   @return [Boolean, nil]
        optional :structured_output, DedalusSDK::Internal::Type::Boolean, nil?: true

        # @!attribute text
        #   Supports text generation
        #
        #   @return [Boolean, nil]
        optional :text, DedalusSDK::Internal::Type::Boolean, nil?: true

        # @!attribute thinking
        #   Supports extended thinking/reasoning
        #
        #   @return [Boolean, nil]
        optional :thinking, DedalusSDK::Internal::Type::Boolean, nil?: true

        # @!attribute tools
        #   Supports function/tool calling
        #
        #   @return [Boolean, nil]
        optional :tools, DedalusSDK::Internal::Type::Boolean, nil?: true

        # @!attribute vision
        #   Supports image understanding
        #
        #   @return [Boolean, nil]
        optional :vision, DedalusSDK::Internal::Type::Boolean, nil?: true

        # @!method initialize(audio: nil, image_generation: nil, input_token_limit: nil, output_token_limit: nil, streaming: nil, structured_output: nil, text: nil, thinking: nil, tools: nil, vision: nil)
        #   Normalized model capabilities across all providers.
        #
        #   @param audio [Boolean, nil] Supports audio processing
        #
        #   @param image_generation [Boolean, nil] Supports image generation
        #
        #   @param input_token_limit [Integer, nil] Maximum input tokens
        #
        #   @param output_token_limit [Integer, nil] Maximum output tokens
        #
        #   @param streaming [Boolean, nil] Supports streaming responses
        #
        #   @param structured_output [Boolean, nil] Supports structured JSON output
        #
        #   @param text [Boolean, nil] Supports text generation
        #
        #   @param thinking [Boolean, nil] Supports extended thinking/reasoning
        #
        #   @param tools [Boolean, nil] Supports function/tool calling
        #
        #   @param vision [Boolean, nil] Supports image understanding
      end

      # @see DedalusSDK::Models::Model#defaults
      class Defaults < DedalusSDK::Internal::Type::BaseModel
        # @!attribute max_output_tokens
        #   Default maximum output tokens
        #
        #   @return [Integer, nil]
        optional :max_output_tokens, Integer, nil?: true

        # @!attribute temperature
        #   Default temperature setting
        #
        #   @return [Float, nil]
        optional :temperature, Float, nil?: true

        # @!attribute top_k
        #   Default top_k setting
        #
        #   @return [Integer, nil]
        optional :top_k, Integer, nil?: true

        # @!attribute top_p
        #   Default top_p setting
        #
        #   @return [Float, nil]
        optional :top_p, Float, nil?: true

        # @!method initialize(max_output_tokens: nil, temperature: nil, top_k: nil, top_p: nil)
        #   Provider-declared default parameters for model generation.
        #
        #   @param max_output_tokens [Integer, nil] Default maximum output tokens
        #
        #   @param temperature [Float, nil] Default temperature setting
        #
        #   @param top_k [Integer, nil] Default top_k setting
        #
        #   @param top_p [Float, nil] Default top_p setting
      end
    end
  end
end
