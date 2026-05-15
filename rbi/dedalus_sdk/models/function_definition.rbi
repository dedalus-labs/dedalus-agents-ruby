# typed: strong

module DedalusSDK
  module Models
    class FunctionDefinition < DedalusSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DedalusSDK::FunctionDefinition, DedalusSDK::Internal::AnyHash)
        end

      # The name of the function to call.
      sig { returns(String) }
      attr_accessor :name

      # Schema for Function.
      #
      # Fields:
      #
      # - name (required): str
      sig { params(name: String).returns(T.attached_class) }
      def self.new(
        # The name of the function to call.
        name:
      )
      end

      sig { override.returns({ name: String }) }
      def to_hash
      end
    end
  end
end
