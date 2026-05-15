# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      class ChoiceLogprobs < DedalusSDK::Internal::Type::BaseModel
        # @!attribute content
        #   A list of message content tokens with log probability information.
        #
        #   @return [Array<DedalusSDK::Models::Chat::ChatCompletionTokenLogprob>, nil]
        optional :content,
                 -> { DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Chat::ChatCompletionTokenLogprob] },
                 nil?: true

        # @!attribute refusal
        #   A list of message refusal tokens with log probability information.
        #
        #   @return [Array<DedalusSDK::Models::Chat::ChatCompletionTokenLogprob>, nil]
        optional :refusal,
                 -> { DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Chat::ChatCompletionTokenLogprob] },
                 nil?: true

        # @!method initialize(content: nil, refusal: nil)
        #   Log probability information for the choice.
        #
        #   @param content [Array<DedalusSDK::Models::Chat::ChatCompletionTokenLogprob>, nil] A list of message content tokens with log probability information.
        #
        #   @param refusal [Array<DedalusSDK::Models::Chat::ChatCompletionTokenLogprob>, nil] A list of message refusal tokens with log probability information.
      end
    end
  end
end
