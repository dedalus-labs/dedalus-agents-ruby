# typed: strong

module DedalusSDK
  module Models
    ChatCompletionContentPartTextParam =
      Chat::ChatCompletionContentPartTextParam

    module Chat
      class ChatCompletionContentPartTextParam < DedalusSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::Chat::ChatCompletionContentPartTextParam,
              DedalusSDK::Internal::AnyHash
            )
          end

        # The text content.
        sig { returns(String) }
        attr_accessor :text

        # The type of the content part.
        sig { returns(Symbol) }
        attr_accessor :type

        # Learn about [text inputs](/docs/guides/text-generation).
        #
        # Fields:
        #
        # - type (required): Literal["text"]
        # - text (required): str
        sig { params(text: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # The text content.
          text:,
          # The type of the content part.
          type: :text
        )
        end

        sig { override.returns({ text: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
