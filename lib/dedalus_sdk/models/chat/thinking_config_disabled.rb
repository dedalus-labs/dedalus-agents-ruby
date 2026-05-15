# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      class ThinkingConfigDisabled < DedalusSDK::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :disabled]
        required :type, const: :disabled

        # @!method initialize(type: :disabled)
        #   Schema for ThinkingConfigDisabled.
        #
        #   Fields:
        #
        #   - type (required): Literal["disabled"]
        #
        #   @param type [Symbol, :disabled]
      end
    end
  end
end
