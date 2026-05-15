# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      class ChatCompletionContentPartTextParam < DedalusSDK::Internal::Type::BaseModel
        # @!attribute text
        #   The text content.
        #
        #   @return [String]
        required :text, String

        # @!attribute type
        #   The type of the content part.
        #
        #   @return [Symbol, :text]
        required :type, const: :text

        # @!method initialize(text:, type: :text)
        #   Learn about [text inputs](/docs/guides/text-generation).
        #
        #   Fields:
        #
        #   - type (required): Literal["text"]
        #   - text (required): str
        #
        #   @param text [String] The text content.
        #
        #   @param type [Symbol, :text] The type of the content part.
      end
    end

    ChatCompletionContentPartTextParam = Chat::ChatCompletionContentPartTextParam
  end
end
