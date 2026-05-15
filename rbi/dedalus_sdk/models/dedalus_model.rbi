# typed: strong

module DedalusSDK
  module Models
    class DedalusModel < DedalusSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DedalusSDK::DedalusModel, DedalusSDK::Internal::AnyHash)
        end

      # Model identifier with provider prefix (e.g., 'openai/gpt-5',
      # 'anthropic/claude-3-5-sonnet').
      sig { returns(String) }
      attr_accessor :model

      # Optional default generation settings (e.g., temperature, max_tokens) applied
      # when this model is selected.
      sig { returns(T.nilable(DedalusSDK::ModelSettings)) }
      attr_reader :settings

      sig do
        params(settings: T.nilable(DedalusSDK::ModelSettings::OrHash)).void
      end
      attr_writer :settings

      # Structured model selection entry used in request payloads.
      #
      # Supports OpenAI-style semantics (string model id) while enabling optional
      # per-model default settings for Dedalus multi-model routing.
      sig do
        params(
          model: String,
          settings: T.nilable(DedalusSDK::ModelSettings::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        # Model identifier with provider prefix (e.g., 'openai/gpt-5',
        # 'anthropic/claude-3-5-sonnet').
        model:,
        # Optional default generation settings (e.g., temperature, max_tokens) applied
        # when this model is selected.
        settings: nil
      )
      end

      sig do
        override.returns(
          { model: String, settings: T.nilable(DedalusSDK::ModelSettings) }
        )
      end
      def to_hash
      end
    end
  end
end
