# frozen_string_literal: true

module DedalusSDK
  module Models
    class DedalusModel < DedalusSDK::Internal::Type::BaseModel
      # @!attribute model
      #   Model identifier with provider prefix (e.g., 'openai/gpt-5',
      #   'anthropic/claude-3-5-sonnet').
      #
      #   @return [String]
      required :model, String

      # @!attribute settings
      #   Optional default generation settings (e.g., temperature, max_tokens) applied
      #   when this model is selected.
      #
      #   @return [DedalusSDK::Models::ModelSettings, nil]
      optional :settings, -> { DedalusSDK::ModelSettings }, nil?: true

      # @!method initialize(model:, settings: nil)
      #   Some parameter documentations has been truncated, see
      #   {DedalusSDK::Models::DedalusModel} for more details.
      #
      #   Structured model selection entry used in request payloads.
      #
      #   Supports OpenAI-style semantics (string model id) while enabling optional
      #   per-model default settings for Dedalus multi-model routing.
      #
      #   @param model [String] Model identifier with provider prefix (e.g., 'openai/gpt-5', 'anthropic/claude-3
      #
      #   @param settings [DedalusSDK::Models::ModelSettings, nil] Optional default generation settings (e.g., temperature, max_tokens) applied whe
    end
  end
end
