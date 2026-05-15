# typed: strong

module DedalusSDK
  module Models
    ChatCompletionDeveloperMessageParam =
      Chat::ChatCompletionDeveloperMessageParam

    module Chat
      class ChatCompletionDeveloperMessageParam < DedalusSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::Chat::ChatCompletionDeveloperMessageParam,
              DedalusSDK::Internal::AnyHash
            )
          end

        # The contents of the developer message.
        sig do
          returns(
            DedalusSDK::Chat::ChatCompletionDeveloperMessageParam::Content::Variants
          )
        end
        attr_accessor :content

        # The role of the messages author, in this case `developer`.
        sig { returns(Symbol) }
        attr_accessor :role

        # An optional name for the participant. Provides the model information to
        # differentiate between participants of the same role.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # Developer-provided instructions that the model should follow, regardless of
        # messages sent by the user. With o1 models and newer, `developer` messages
        # replace the previous `system` messages.
        #
        # Fields:
        #
        # - content (required): str |
        #   Annotated[list[ChatCompletionRequestMessageContentPartText], MinLen(1),
        #   ArrayTitle("ChatCompletionRequestDeveloperMessageContentArray")]
        # - role (required): Literal["developer"]
        # - name (optional): str
        sig do
          params(
            content:
              DedalusSDK::Chat::ChatCompletionDeveloperMessageParam::Content::Variants,
            name: String,
            role: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The contents of the developer message.
          content:,
          # An optional name for the participant. Provides the model information to
          # differentiate between participants of the same role.
          name: nil,
          # The role of the messages author, in this case `developer`.
          role: :developer
        )
        end

        sig do
          override.returns(
            {
              content:
                DedalusSDK::Chat::ChatCompletionDeveloperMessageParam::Content::Variants,
              role: Symbol,
              name: String
            }
          )
        end
        def to_hash
        end

        # The contents of the developer message.
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
                DedalusSDK::Chat::ChatCompletionDeveloperMessageParam::Content::Variants
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
