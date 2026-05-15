# typed: strong

module DedalusSDK
  module Models
    class ListModelsResponse < DedalusSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DedalusSDK::ListModelsResponse, DedalusSDK::Internal::AnyHash)
        end

      # List of available models
      sig { returns(T::Array[DedalusSDK::Model]) }
      attr_accessor :data

      # Response object type
      sig do
        returns(T.nilable(DedalusSDK::ListModelsResponse::Object::TaggedSymbol))
      end
      attr_reader :object

      sig do
        params(object: DedalusSDK::ListModelsResponse::Object::OrSymbol).void
      end
      attr_writer :object

      # Response for /v1/models endpoint.
      sig do
        params(
          data: T::Array[DedalusSDK::Model::OrHash],
          object: DedalusSDK::ListModelsResponse::Object::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # List of available models
        data:,
        # Response object type
        object: nil
      )
      end

      sig do
        override.returns(
          {
            data: T::Array[DedalusSDK::Model],
            object: DedalusSDK::ListModelsResponse::Object::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # Response object type
      module Object
        extend DedalusSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, DedalusSDK::ListModelsResponse::Object) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LIST =
          T.let(:list, DedalusSDK::ListModelsResponse::Object::TaggedSymbol)

        sig do
          override.returns(
            T::Array[DedalusSDK::ListModelsResponse::Object::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
