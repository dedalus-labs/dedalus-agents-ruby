# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      class ChatCompletionToolMessageParam < DedalusSDK::Internal::Type::BaseModel
        # @!attribute content
        #   The contents of the tool message.
        #
        #   @return [String, Array<DedalusSDK::Models::Chat::ChatCompletionContentPartTextParam>]
        required :content, union: -> { DedalusSDK::Chat::ChatCompletionToolMessageParam::Content }

        # @!attribute role
        #   The role of the messages author, in this case `tool`.
        #
        #   @return [Symbol, :tool]
        required :role, const: :tool

        # @!attribute tool_call_id
        #   Tool call that this message is responding to.
        #
        #   @return [String]
        required :tool_call_id, String

        # @!method initialize(content:, tool_call_id:, role: :tool)
        #   Schema for ChatCompletionRequestToolMessage.
        #
        #   Fields:
        #
        #   - role (required): Literal["tool"]
        #   - content (required): str |
        #     Annotated[list[ChatCompletionRequestToolMessageContentPart], MinLen(1),
        #     ArrayTitle("ChatCompletionRequestToolMessageContentArray")]
        #   - tool_call_id (required): str
        #
        #   @param content [String, Array<DedalusSDK::Models::Chat::ChatCompletionContentPartTextParam>] The contents of the tool message.
        #
        #   @param tool_call_id [String] Tool call that this message is responding to.
        #
        #   @param role [Symbol, :tool] The role of the messages author, in this case `tool`.

        # The contents of the tool message.
        #
        # @see DedalusSDK::Models::Chat::ChatCompletionToolMessageParam#content
        module Content
          extend DedalusSDK::Internal::Type::Union

          variant String

          variant -> { DedalusSDK::Models::Chat::ChatCompletionToolMessageParam::Content::ChatCompletionContentPartTextParamArray }

          # @!method self.variants
          #   @return [Array(String, Array<DedalusSDK::Models::Chat::ChatCompletionContentPartTextParam>)]

          # @type [DedalusSDK::Internal::Type::Converter]
          ChatCompletionContentPartTextParamArray =
            DedalusSDK::Internal::Type::ArrayOf[-> { DedalusSDK::Chat::ChatCompletionContentPartTextParam }]
        end
      end
    end

    ChatCompletionToolMessageParam = Chat::ChatCompletionToolMessageParam
  end
end
