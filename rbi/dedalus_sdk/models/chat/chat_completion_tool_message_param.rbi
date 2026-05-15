# typed: strong

module DedalusSDK
  module Models
    ChatCompletionToolMessageParam = Chat::ChatCompletionToolMessageParam

    module Chat
      class ChatCompletionToolMessageParam < DedalusSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::Chat::ChatCompletionToolMessageParam,
              DedalusSDK::Internal::AnyHash
            )
          end

        # The contents of the tool message.
        sig do
          returns(
            DedalusSDK::Chat::ChatCompletionToolMessageParam::Content::Variants
          )
        end
        attr_accessor :content

        # The role of the messages author, in this case `tool`.
        sig { returns(Symbol) }
        attr_accessor :role

        # Tool call that this message is responding to.
        sig { returns(String) }
        attr_accessor :tool_call_id

        # Schema for ChatCompletionRequestToolMessage.
        #
        # Fields:
        #
        # - role (required): Literal["tool"]
        # - content (required): str |
        #   Annotated[list[ChatCompletionRequestToolMessageContentPart], MinLen(1),
        #   ArrayTitle("ChatCompletionRequestToolMessageContentArray")]
        # - tool_call_id (required): str
        sig do
          params(
            content:
              DedalusSDK::Chat::ChatCompletionToolMessageParam::Content::Variants,
            tool_call_id: String,
            role: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The contents of the tool message.
          content:,
          # Tool call that this message is responding to.
          tool_call_id:,
          # The role of the messages author, in this case `tool`.
          role: :tool
        )
        end

        sig do
          override.returns(
            {
              content:
                DedalusSDK::Chat::ChatCompletionToolMessageParam::Content::Variants,
              role: Symbol,
              tool_call_id: String
            }
          )
        end
        def to_hash
        end

        # The contents of the tool message.
        module Content
          extend DedalusSDK::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                String,
                T::Array[DedalusSDK::Chat::ChatCompletionContentPartTextParam]
              )
            end

          sig do
            override.returns(
              T::Array[
                DedalusSDK::Chat::ChatCompletionToolMessageParam::Content::Variants
              ]
            )
          end
          def self.variants
          end

          ChatCompletionContentPartTextParamArray =
            T.let(
              DedalusSDK::Internal::Type::ArrayOf[
                DedalusSDK::Chat::ChatCompletionContentPartTextParam
              ],
              DedalusSDK::Internal::Type::Converter
            )
        end
      end
    end
  end
end
