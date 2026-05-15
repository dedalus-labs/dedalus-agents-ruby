# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      class ChatCompletionFunctions < DedalusSDK::Internal::Type::BaseModel
        # @!attribute name
        #   The name of the function to be called. Must be a-z, A-Z, 0-9, or contain
        #   underscores and dashes, with a maximum length of 64.
        #
        #   @return [String]
        required :name, String

        # @!attribute description
        #   A description of what the function does, used by the model to choose when and
        #   how to call the function.
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute parameters
        #   The parameters the functions accepts, described as a JSON Schema object. See the
        #   [guide](/docs/guides/function-calling) for examples, and the
        #   [JSON Schema reference](https://json-schema.org/understanding-json-schema/) for
        #   documentation about the format.
        #
        #   Omitting `parameters` defines a function with an empty parameter list.
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :parameters, DedalusSDK::Internal::Type::HashOf[DedalusSDK::Internal::Type::Unknown]

        # @!method initialize(name:, description: nil, parameters: nil)
        #   Some parameter documentations has been truncated, see
        #   {DedalusSDK::Models::Chat::ChatCompletionFunctions} for more details.
        #
        #   Schema for ChatCompletionFunctions.
        #
        #   Fields:
        #
        #   - description (optional): str
        #   - name (required): str
        #   - parameters (optional): FunctionParameters
        #
        #   @param name [String] The name of the function to be called. Must be a-z, A-Z, 0-9, or contain undersc
        #
        #   @param description [String] A description of what the function does, used by the model to choose when and ho
        #
        #   @param parameters [Hash{Symbol=>Object}] The parameters the functions accepts, described as a JSON Schema object. See the
      end
    end

    ChatCompletionFunctions = Chat::ChatCompletionFunctions
  end
end
