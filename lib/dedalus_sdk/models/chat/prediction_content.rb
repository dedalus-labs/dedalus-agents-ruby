# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      class PredictionContent < DedalusSDK::Internal::Type::BaseModel
        # @!attribute content
        #   The content that should be matched when generating a model response. If
        #   generated tokens would match this content, the entire model response can be
        #   returned much more quickly.
        #
        #   @return [String, Array<DedalusSDK::Models::Chat::ChatCompletionContentPartTextParam>]
        required :content, union: -> { DedalusSDK::Chat::PredictionContent::Content }

        # @!attribute type
        #   The type of the predicted content you want to provide. This type is currently
        #   always `content`.
        #
        #   @return [Symbol, :content]
        required :type, const: :content

        # @!method initialize(content:, type: :content)
        #   Some parameter documentations has been truncated, see
        #   {DedalusSDK::Models::Chat::PredictionContent} for more details.
        #
        #   Static predicted output content, such as the content of a text file that is
        #   being regenerated.
        #
        #   Fields:
        #
        #   - type (required): Literal["content"]
        #   - content (required): str |
        #     Annotated[list[ChatCompletionRequestMessageContentPartText], MinLen(1),
        #     ArrayTitle("PredictionContentArray")]
        #
        #   @param content [String, Array<DedalusSDK::Models::Chat::ChatCompletionContentPartTextParam>] The content that should be matched when generating a model response.
        #
        #   @param type [Symbol, :content] The type of the predicted content you want to provide. This type is

        # The content that should be matched when generating a model response. If
        # generated tokens would match this content, the entire model response can be
        # returned much more quickly.
        #
        # @see DedalusSDK::Models::Chat::PredictionContent#content
        module Content
          extend DedalusSDK::Internal::Type::Union

          variant String

          variant -> { DedalusSDK::Models::Chat::PredictionContent::Content::ChatCompletionContentPartTextParamArray }

          # @!method self.variants
          #   @return [Array(String, Array<DedalusSDK::Models::Chat::ChatCompletionContentPartTextParam>)]

          # @type [DedalusSDK::Internal::Type::Converter]
          ChatCompletionContentPartTextParamArray =
            DedalusSDK::Internal::Type::ArrayOf[-> { DedalusSDK::Chat::ChatCompletionContentPartTextParam }]
        end
      end
    end
  end
end
