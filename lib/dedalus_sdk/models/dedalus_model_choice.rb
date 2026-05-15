# frozen_string_literal: true

module DedalusSDK
  module Models
    # Dedalus model choice - either a string ID or DedalusModel configuration object.
    module DedalusModelChoice
      extend DedalusSDK::Internal::Type::Union

      # Model identifier string (e.g., 'openai/gpt-5', 'anthropic/claude-3-5-sonnet').
      variant String

      # Structured model selection entry used in request payloads.
      #
      # Supports OpenAI-style semantics (string model id) while enabling
      # optional per-model default settings for Dedalus multi-model routing.
      variant -> { DedalusSDK::DedalusModel }

      # @!method self.variants
      #   @return [Array(String, DedalusSDK::Models::DedalusModel)]
    end
  end
end
