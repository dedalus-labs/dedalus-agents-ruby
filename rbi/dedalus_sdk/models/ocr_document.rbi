# typed: strong

module DedalusSDK
  module Models
    class OCRDocument < DedalusSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DedalusSDK::OCRDocument, DedalusSDK::Internal::AnyHash)
        end

      # Data URI with base64-encoded document
      sig { returns(String) }
      attr_accessor :document_url

      sig { returns(T.nilable(String)) }
      attr_reader :type

      sig { params(type: String).void }
      attr_writer :type

      # Document input for OCR.
      sig do
        params(document_url: String, type: String).returns(T.attached_class)
      end
      def self.new(
        # Data URI with base64-encoded document
        document_url:,
        type: nil
      )
      end

      sig { override.returns({ document_url: String, type: String }) }
      def to_hash
      end
    end
  end
end
