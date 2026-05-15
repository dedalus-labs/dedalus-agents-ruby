# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      class ToolChoiceAuto < DedalusSDK::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :auto]
        required :type, const: :auto

        # @!attribute disable_parallel_tool_use
        #   Whether to disable parallel tool use.
        #
        #   Defaults to `false`. If set to `true`, the model will output at most one tool
        #   use.
        #
        #   @return [Boolean, nil]
        optional :disable_parallel_tool_use, DedalusSDK::Internal::Type::Boolean

        # @!method initialize(disable_parallel_tool_use: nil, type: :auto)
        #   Some parameter documentations has been truncated, see
        #   {DedalusSDK::Models::Chat::ToolChoiceAuto} for more details.
        #
        #   The model will automatically decide whether to use tools.
        #
        #   Fields:
        #
        #   - disable_parallel_tool_use (optional): bool
        #   - type (required): Literal["auto"]
        #
        #   @param disable_parallel_tool_use [Boolean] Whether to disable parallel tool use.
        #
        #   @param type [Symbol, :auto]
      end
    end
  end
end
