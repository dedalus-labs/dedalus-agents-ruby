# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      class ToolChoiceAny < DedalusSDK::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :any]
        required :type, const: :any

        # @!attribute disable_parallel_tool_use
        #   Whether to disable parallel tool use.
        #
        #   Defaults to `false`. If set to `true`, the model will output exactly one tool
        #   use.
        #
        #   @return [Boolean, nil]
        optional :disable_parallel_tool_use, DedalusSDK::Internal::Type::Boolean

        # @!method initialize(disable_parallel_tool_use: nil, type: :any)
        #   Some parameter documentations has been truncated, see
        #   {DedalusSDK::Models::Chat::ToolChoiceAny} for more details.
        #
        #   The model will use any available tools.
        #
        #   Fields:
        #
        #   - disable_parallel_tool_use (optional): bool
        #   - type (required): Literal["any"]
        #
        #   @param disable_parallel_tool_use [Boolean] Whether to disable parallel tool use.
        #
        #   @param type [Symbol, :any]
      end
    end
  end
end
