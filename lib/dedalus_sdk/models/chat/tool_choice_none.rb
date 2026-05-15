# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      class ToolChoiceNone < DedalusSDK::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :none]
        required :type, const: :none

        # @!method initialize(type: :none)
        #   The model will not be allowed to use tools.
        #
        #   Fields:
        #
        #   - type (required): Literal["none"]
        #
        #   @param type [Symbol, :none]
      end
    end
  end
end
