# typed: strong

module DedalusSDK
  module Models
    ChatCompletionFunctionMessageParam =
      Chat::ChatCompletionFunctionMessageParam

    module Chat
      class ChatCompletionFunctionMessageParam < DedalusSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::Chat::ChatCompletionFunctionMessageParam,
              DedalusSDK::Internal::AnyHash
            )
          end

        # The contents of the function message.
        sig { returns(T.nilable(String)) }
        attr_accessor :content

        # The name of the function to call.
        sig { returns(String) }
        attr_accessor :name

        # The role of the messages author, in this case `function`.
        sig { returns(Symbol) }
        attr_accessor :role

        # Schema for ChatCompletionRequestFunctionMessage.
        #
        # Fields:
        #
        # - role (required): Literal["function"]
        # - content (required): str | None
        # - name (required): str
        sig do
          params(
            content: T.nilable(String),
            name: String,
            role: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The contents of the function message.
          content:,
          # The name of the function to call.
          name:,
          # The role of the messages author, in this case `function`.
          role: :function
        )
        end

        sig do
          override.returns(
            { content: T.nilable(String), name: String, role: Symbol }
          )
        end
        def to_hash
        end
      end
    end
  end
end
