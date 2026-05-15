# typed: strong

module DedalusSDK
  module Models
    class OCRResponse < DedalusSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(DedalusSDK::OCRResponse, DedalusSDK::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :model

      sig { returns(T::Array[DedalusSDK::OCRPage]) }
      attr_accessor :pages

      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_accessor :usage

      # OCR response schema.
      sig do
        params(
          model: String,
          pages: T::Array[DedalusSDK::OCRPage::OrHash],
          usage: T.nilable(T::Hash[Symbol, T.anything])
        ).returns(T.attached_class)
      end
      def self.new(model:, pages:, usage: nil)
      end

      sig do
        override.returns(
          {
            model: String,
            pages: T::Array[DedalusSDK::OCRPage],
            usage: T.nilable(T::Hash[Symbol, T.anything])
          }
        )
      end
      def to_hash
      end
    end
  end
end
