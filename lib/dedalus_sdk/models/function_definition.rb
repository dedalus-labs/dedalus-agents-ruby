# frozen_string_literal: true

module DedalusSDK
  module Models
    class FunctionDefinition < DedalusSDK::Internal::Type::BaseModel
      # @!attribute name
      #   The name of the function to call.
      #
      #   @return [String]
      required :name, String

      # @!method initialize(name:)
      #   Schema for Function.
      #
      #   Fields:
      #
      #   - name (required): str
      #
      #   @param name [String] The name of the function to call.
    end
  end
end
