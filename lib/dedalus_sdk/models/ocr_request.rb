# frozen_string_literal: true

module DedalusSDK
  module Models
    class OCRRequest < DedalusSDK::Internal::Type::BaseModel
      # @!attribute document
      #   Document input for OCR.
      #
      #   @return [DedalusSDK::Models::OCRDocument]
      required :document, -> { DedalusSDK::OCRDocument }

      # @!attribute model
      #
      #   @return [String, nil]
      optional :model, String

      # @!method initialize(document:, model: nil)
      #   OCR request schema.
      #
      #   @param document [DedalusSDK::Models::OCRDocument] Document input for OCR.
      #
      #   @param model [String]
    end
  end
end
