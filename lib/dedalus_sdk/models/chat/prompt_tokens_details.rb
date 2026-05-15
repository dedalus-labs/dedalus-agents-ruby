# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      class PromptTokensDetails < DedalusSDK::Internal::Type::BaseModel
        # @!attribute audio_tokens
        #   Audio input tokens present in the prompt.
        #
        #   @return [Integer, nil]
        optional :audio_tokens, Integer

        # @!attribute cached_tokens
        #   Cached tokens present in the prompt.
        #
        #   @return [Integer, nil]
        optional :cached_tokens, Integer

        # @!method initialize(audio_tokens: nil, cached_tokens: nil)
        #   Breakdown of tokens used in the prompt.
        #
        #   Fields:
        #
        #   - audio_tokens (optional): int
        #   - cached_tokens (optional): int
        #
        #   @param audio_tokens [Integer] Audio input tokens present in the prompt.
        #
        #   @param cached_tokens [Integer] Cached tokens present in the prompt.
      end
    end
  end
end
