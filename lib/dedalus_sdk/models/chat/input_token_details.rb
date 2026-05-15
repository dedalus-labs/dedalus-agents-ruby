# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      class InputTokenDetails < DedalusSDK::Internal::Type::BaseModel
        # @!attribute audio_tokens
        #   Number of audio tokens billed for this request.
        #
        #   @return [Integer, nil]
        optional :audio_tokens, Integer

        # @!attribute text_tokens
        #   Number of text tokens billed for this request.
        #
        #   @return [Integer, nil]
        optional :text_tokens, Integer

        # @!method initialize(audio_tokens: nil, text_tokens: nil)
        #   Details about the input tokens billed for this request.
        #
        #   Fields:
        #
        #   - text_tokens (optional): int
        #   - audio_tokens (optional): int
        #
        #   @param audio_tokens [Integer] Number of audio tokens billed for this request.
        #
        #   @param text_tokens [Integer] Number of text tokens billed for this request.
      end
    end
  end
end
