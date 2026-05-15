# typed: strong

module DedalusSDK
  module Models
    ChatCompletionUserMessageParam = Chat::ChatCompletionUserMessageParam

    module Chat
      class ChatCompletionUserMessageParam < DedalusSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::Chat::ChatCompletionUserMessageParam,
              DedalusSDK::Internal::AnyHash
            )
          end

        # The contents of the user message.
        sig do
          returns(
            DedalusSDK::Chat::ChatCompletionUserMessageParam::Content::Variants
          )
        end
        attr_accessor :content

        # The role of the messages author, in this case `user`.
        sig { returns(Symbol) }
        attr_accessor :role

        # An optional name for the participant. Provides the model information to
        # differentiate between participants of the same role.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # Messages sent by an end user, containing prompts or additional context
        # information.
        #
        # Fields:
        #
        # - content (required): str |
        #   Annotated[list[ChatCompletionRequestUserMessageContentPart], MinLen(1),
        #   ArrayTitle("ChatCompletionRequestUserMessageContentArray")]
        # - role (required): Literal["user"]
        # - name (optional): str
        sig do
          params(
            content:
              DedalusSDK::Chat::ChatCompletionUserMessageParam::Content::Variants,
            name: String,
            role: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The contents of the user message.
          content:,
          # An optional name for the participant. Provides the model information to
          # differentiate between participants of the same role.
          name: nil,
          # The role of the messages author, in this case `user`.
          role: :user
        )
        end

        sig do
          override.returns(
            {
              content:
                DedalusSDK::Chat::ChatCompletionUserMessageParam::Content::Variants,
              role: Symbol,
              name: String
            }
          )
        end
        def to_hash
        end

        # The contents of the user message.
        module Content
          extend DedalusSDK::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                String,
                T::Array[
                  DedalusSDK::Chat::ChatCompletionUserMessageParam::Content::ChatCompletionRequestUserMessageContentArray::Variants
                ]
              )
            end

          # Learn about [text inputs](/docs/guides/text-generation).
          #
          # Fields:
          #
          # - type (required): Literal["text"]
          # - text (required): str
          module ChatCompletionRequestUserMessageContentArray
            extend DedalusSDK::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  DedalusSDK::Chat::ChatCompletionContentPartTextParam,
                  DedalusSDK::Chat::ChatCompletionContentPartImageParam,
                  DedalusSDK::Chat::ChatCompletionContentPartInputAudioParam,
                  DedalusSDK::Chat::ChatCompletionContentPartFileParam
                )
              end

            sig do
              override.returns(
                T::Array[
                  DedalusSDK::Chat::ChatCompletionUserMessageParam::Content::ChatCompletionRequestUserMessageContentArray::Variants
                ]
              )
            end
            def self.variants
            end
          end

          sig do
            override.returns(
              T::Array[
                DedalusSDK::Chat::ChatCompletionUserMessageParam::Content::Variants
              ]
            )
          end
          def self.variants
          end

          ChatCompletionRequestUserMessageContent2DArray =
            T.let(
              DedalusSDK::Internal::Type::ArrayOf[
                union:
                  DedalusSDK::Chat::ChatCompletionUserMessageParam::Content::ChatCompletionRequestUserMessageContentArray
              ],
              DedalusSDK::Internal::Type::Converter
            )
        end
      end
    end
  end
end
