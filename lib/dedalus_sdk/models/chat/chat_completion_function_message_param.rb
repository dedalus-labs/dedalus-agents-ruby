# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      class ChatCompletionFunctionMessageParam < DedalusSDK::Internal::Type::BaseModel
        # @!attribute content
        #   The contents of the function message.
        #
        #   @return [String, nil]
        required :content, String, nil?: true

        # @!attribute name
        #   The name of the function to call.
        #
        #   @return [String]
        required :name, String

        # @!attribute role
        #   The role of the messages author, in this case `function`.
        #
        #   @return [Symbol, :function]
        required :role, const: :function

        # @!method initialize(content:, name:, role: :function)
        #   Schema for ChatCompletionRequestFunctionMessage.
        #
        #   Fields:
        #
        #   - role (required): Literal["function"]
        #   - content (required): str | None
        #   - name (required): str
        #
        #   @param content [String, nil] The contents of the function message.
        #
        #   @param name [String] The name of the function to call.
        #
        #   @param role [Symbol, :function] The role of the messages author, in this case `function`.
      end
    end

    ChatCompletionFunctionMessageParam = Chat::ChatCompletionFunctionMessageParam
  end
end
