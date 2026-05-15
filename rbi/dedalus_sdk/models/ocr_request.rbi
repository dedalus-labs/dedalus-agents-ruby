# typed: strong

module DedalusSDK
  module Models
    class OCRRequest < DedalusSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DedalusSDK::OCRRequest, DedalusSDK::Internal::AnyHash)
        end

      # Document input for OCR.
      sig { returns(DedalusSDK::OCRDocument) }
      attr_reader :document

      sig { params(document: DedalusSDK::OCRDocument::OrHash).void }
      attr_writer :document

      sig { returns(T.nilable(String)) }
      attr_reader :model

      sig { params(model: String).void }
      attr_writer :model

      # OCR request schema.
      sig do
        params(
          document: DedalusSDK::OCRDocument::OrHash,
          model: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Document input for OCR.
        document:,
        model: nil
      )
      end

      sig do
        override.returns({ document: DedalusSDK::OCRDocument, model: String })
      end
      def to_hash
      end
    end
  end
end
