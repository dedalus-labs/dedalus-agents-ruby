# typed: strong

module DedalusSDK
  module Models
    class OCRProcessParams < DedalusSDK::Models::OCRRequest
      extend DedalusSDK::Internal::Type::RequestParameters::Converter
      include DedalusSDK::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(DedalusSDK::OCRProcessParams, DedalusSDK::Internal::AnyHash)
        end

      sig do
        params(request_options: DedalusSDK::RequestOptions::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(request_options: {})
      end

      sig { override.returns({ request_options: DedalusSDK::RequestOptions }) }
      def to_hash
      end
    end
  end
end
