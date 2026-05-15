# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      class StreamChoiceLogprobs < DedalusSDK::Internal::Type::BaseModel
        # @!attribute content
        #   A list of message content tokens with log probability information.
        #
        #   @return [Array<DedalusSDK::Models::Chat::ChatCompletionTokenLogprob>, nil]
        required :content,
                 -> { DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Chat::ChatCompletionTokenLogprob] },
                 nil?: true

        # @!attribute refusal
        #   A list of message refusal tokens with log probability information.
        #
        #   @return [Array<DedalusSDK::Models::Chat::ChatCompletionTokenLogprob>, nil]
        required :refusal,
                 -> { DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Chat::ChatCompletionTokenLogprob] },
                 nil?: true

        # @!method initialize(content:, refusal:)
        #   Log probability information for the choice.
        #
        #   Fields:
        #
        #   - content (required): list[ChatCompletionTokenLogprob]
        #   - refusal (required): list[ChatCompletionTokenLogprob]
        #
        #   @param content [Array<DedalusSDK::Models::Chat::ChatCompletionTokenLogprob>, nil] A list of message content tokens with log probability information.
        #
        #   @param refusal [Array<DedalusSDK::Models::Chat::ChatCompletionTokenLogprob>, nil] A list of message refusal tokens with log probability information.
      end
    end
  end
end
