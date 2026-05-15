# typed: strong

module DedalusSDK
  module Models
    class OCRPage < DedalusSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DedalusSDK::OCRPage, DedalusSDK::Internal::AnyHash)
        end

      sig { returns(Integer) }
      attr_accessor :index

      sig { returns(String) }
      attr_accessor :markdown

      # Single page OCR result.
      sig { params(index: Integer, markdown: String).returns(T.attached_class) }
      def self.new(index:, markdown:)
      end

      sig { override.returns({ index: Integer, markdown: String }) }
      def to_hash
      end
    end
  end
end
