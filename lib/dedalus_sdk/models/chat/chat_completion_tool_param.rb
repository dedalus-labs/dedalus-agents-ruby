# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      class ChatCompletionToolParam < DedalusSDK::Internal::Type::BaseModel
        # @!attribute function
        #   Schema for Function.
        #
        #   Fields:
        #
        #   - name (required): str
        #
        #   @return [DedalusSDK::Models::FunctionDefinition]
        required :function, -> { DedalusSDK::FunctionDefinition }

        # @!attribute type
        #
        #   @return [Symbol, DedalusSDK::Models::Chat::ChatCompletionToolParam::Type, nil]
        optional :type, enum: -> { DedalusSDK::Chat::ChatCompletionToolParam::Type }

        # @!method initialize(function:, type: nil)
        #   Some parameter documentations has been truncated, see
        #   {DedalusSDK::Models::Chat::ChatCompletionToolParam} for more details.
        #
        #   Schema for Tool.
        #
        #   Fields:
        #
        #   - type (optional): ToolTypes
        #   - function (required): Function
        #
        #   @param function [DedalusSDK::Models::FunctionDefinition] Schema for Function.
        #
        #   @param type [Symbol, DedalusSDK::Models::Chat::ChatCompletionToolParam::Type]

        # @see DedalusSDK::Models::Chat::ChatCompletionToolParam#type
        module Type
          extend DedalusSDK::Internal::Type::Enum

          FUNCTION = :function

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    ChatCompletionToolParam = Chat::ChatCompletionToolParam
  end
end
