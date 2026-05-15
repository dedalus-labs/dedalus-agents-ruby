# typed: strong

module DedalusSDK
  module Models
    class Model < DedalusSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(DedalusSDK::Model, DedalusSDK::Internal::AnyHash) }

      # Unique model identifier with provider prefix (e.g., 'openai/gpt-4')
      sig { returns(String) }
      attr_accessor :id

      # When the model was released (RFC 3339)
      sig { returns(Time) }
      attr_accessor :created_at

      # Provider that hosts this model
      sig { returns(DedalusSDK::Model::Provider::TaggedSymbol) }
      attr_accessor :provider

      # Normalized model capabilities across all providers.
      sig { returns(T.nilable(DedalusSDK::Model::Capabilities)) }
      attr_reader :capabilities

      sig do
        params(
          capabilities: T.nilable(DedalusSDK::Model::Capabilities::OrHash)
        ).void
      end
      attr_writer :capabilities

      # Provider-declared default parameters for model generation.
      sig { returns(T.nilable(DedalusSDK::Model::Defaults)) }
      attr_reader :defaults

      sig do
        params(defaults: T.nilable(DedalusSDK::Model::Defaults::OrHash)).void
      end
      attr_writer :defaults

      # Model description
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Human-readable model name
      sig { returns(T.nilable(String)) }
      attr_accessor :display_name

      # Provider-specific generation method names (None = not declared)
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :provider_declared_generation_methods

      # Raw provider-specific metadata
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :provider_info

      # Model version identifier
      sig { returns(T.nilable(String)) }
      attr_accessor :version

      # Unified model metadata across all providers.
      #
      # Combines provider-specific schemas into a single, consistent format. Fields that
      # aren't available from a provider are set to None.
      sig do
        params(
          id: String,
          created_at: Time,
          provider: DedalusSDK::Model::Provider::OrSymbol,
          capabilities: T.nilable(DedalusSDK::Model::Capabilities::OrHash),
          defaults: T.nilable(DedalusSDK::Model::Defaults::OrHash),
          description: T.nilable(String),
          display_name: T.nilable(String),
          provider_declared_generation_methods: T.nilable(T::Array[String]),
          provider_info: T.nilable(T::Hash[Symbol, T.anything]),
          version: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique model identifier with provider prefix (e.g., 'openai/gpt-4')
        id:,
        # When the model was released (RFC 3339)
        created_at:,
        # Provider that hosts this model
        provider:,
        # Normalized model capabilities across all providers.
        capabilities: nil,
        # Provider-declared default parameters for model generation.
        defaults: nil,
        # Model description
        description: nil,
        # Human-readable model name
        display_name: nil,
        # Provider-specific generation method names (None = not declared)
        provider_declared_generation_methods: nil,
        # Raw provider-specific metadata
        provider_info: nil,
        # Model version identifier
        version: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            provider: DedalusSDK::Model::Provider::TaggedSymbol,
            capabilities: T.nilable(DedalusSDK::Model::Capabilities),
            defaults: T.nilable(DedalusSDK::Model::Defaults),
            description: T.nilable(String),
            display_name: T.nilable(String),
            provider_declared_generation_methods: T.nilable(T::Array[String]),
            provider_info: T.nilable(T::Hash[Symbol, T.anything]),
            version: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      # Provider that hosts this model
      module Provider
        extend DedalusSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, DedalusSDK::Model::Provider) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OPENAI = T.let(:openai, DedalusSDK::Model::Provider::TaggedSymbol)
        ANTHROPIC = T.let(:anthropic, DedalusSDK::Model::Provider::TaggedSymbol)
        GOOGLE = T.let(:google, DedalusSDK::Model::Provider::TaggedSymbol)
        XAI = T.let(:xai, DedalusSDK::Model::Provider::TaggedSymbol)
        MISTRAL = T.let(:mistral, DedalusSDK::Model::Provider::TaggedSymbol)
        GROQ = T.let(:groq, DedalusSDK::Model::Provider::TaggedSymbol)
        FIREWORKS = T.let(:fireworks, DedalusSDK::Model::Provider::TaggedSymbol)
        DEEPSEEK = T.let(:deepseek, DedalusSDK::Model::Provider::TaggedSymbol)
        MOONSHOT = T.let(:moonshot, DedalusSDK::Model::Provider::TaggedSymbol)
        CEREBRAS = T.let(:cerebras, DedalusSDK::Model::Provider::TaggedSymbol)

        sig do
          override.returns(T::Array[DedalusSDK::Model::Provider::TaggedSymbol])
        end
        def self.values
        end
      end

      class Capabilities < DedalusSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::Model::Capabilities,
              DedalusSDK::Internal::AnyHash
            )
          end

        # Supports audio processing
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :audio

        # Supports image generation
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :image_generation

        # Maximum input tokens
        sig { returns(T.nilable(Integer)) }
        attr_accessor :input_token_limit

        # Maximum output tokens
        sig { returns(T.nilable(Integer)) }
        attr_accessor :output_token_limit

        # Supports streaming responses
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :streaming

        # Supports structured JSON output
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :structured_output

        # Supports text generation
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :text

        # Supports extended thinking/reasoning
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :thinking

        # Supports function/tool calling
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :tools

        # Supports image understanding
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :vision

        # Normalized model capabilities across all providers.
        sig do
          params(
            audio: T.nilable(T::Boolean),
            image_generation: T.nilable(T::Boolean),
            input_token_limit: T.nilable(Integer),
            output_token_limit: T.nilable(Integer),
            streaming: T.nilable(T::Boolean),
            structured_output: T.nilable(T::Boolean),
            text: T.nilable(T::Boolean),
            thinking: T.nilable(T::Boolean),
            tools: T.nilable(T::Boolean),
            vision: T.nilable(T::Boolean)
          ).returns(T.attached_class)
        end
        def self.new(
          # Supports audio processing
          audio: nil,
          # Supports image generation
          image_generation: nil,
          # Maximum input tokens
          input_token_limit: nil,
          # Maximum output tokens
          output_token_limit: nil,
          # Supports streaming responses
          streaming: nil,
          # Supports structured JSON output
          structured_output: nil,
          # Supports text generation
          text: nil,
          # Supports extended thinking/reasoning
          thinking: nil,
          # Supports function/tool calling
          tools: nil,
          # Supports image understanding
          vision: nil
        )
        end

        sig do
          override.returns(
            {
              audio: T.nilable(T::Boolean),
              image_generation: T.nilable(T::Boolean),
              input_token_limit: T.nilable(Integer),
              output_token_limit: T.nilable(Integer),
              streaming: T.nilable(T::Boolean),
              structured_output: T.nilable(T::Boolean),
              text: T.nilable(T::Boolean),
              thinking: T.nilable(T::Boolean),
              tools: T.nilable(T::Boolean),
              vision: T.nilable(T::Boolean)
            }
          )
        end
        def to_hash
        end
      end

      class Defaults < DedalusSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(DedalusSDK::Model::Defaults, DedalusSDK::Internal::AnyHash)
          end

        # Default maximum output tokens
        sig { returns(T.nilable(Integer)) }
        attr_accessor :max_output_tokens

        # Default temperature setting
        sig { returns(T.nilable(Float)) }
        attr_accessor :temperature

        # Default top_k setting
        sig { returns(T.nilable(Integer)) }
        attr_accessor :top_k

        # Default top_p setting
        sig { returns(T.nilable(Float)) }
        attr_accessor :top_p

        # Provider-declared default parameters for model generation.
        sig do
          params(
            max_output_tokens: T.nilable(Integer),
            temperature: T.nilable(Float),
            top_k: T.nilable(Integer),
            top_p: T.nilable(Float)
          ).returns(T.attached_class)
        end
        def self.new(
          # Default maximum output tokens
          max_output_tokens: nil,
          # Default temperature setting
          temperature: nil,
          # Default top_k setting
          top_k: nil,
          # Default top_p setting
          top_p: nil
        )
        end

        sig do
          override.returns(
            {
              max_output_tokens: T.nilable(Integer),
              temperature: T.nilable(Float),
              top_k: T.nilable(Integer),
              top_p: T.nilable(Float)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
