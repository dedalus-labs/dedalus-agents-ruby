# typed: strong

module DedalusSDK
  module Models
    class ModelRetrieveParams < DedalusSDK::Internal::Type::BaseModel
      extend DedalusSDK::Internal::Type::RequestParameters::Converter
      include DedalusSDK::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(DedalusSDK::ModelRetrieveParams, DedalusSDK::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :model_id

      sig do
        params(
          model_id: String,
          request_options: DedalusSDK::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(model_id:, request_options: {})
      end

      sig do
        override.returns(
          { model_id: String, request_options: DedalusSDK::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
