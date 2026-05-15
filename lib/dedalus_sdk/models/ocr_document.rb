# frozen_string_literal: true

module DedalusSDK
  module Models
    class OCRDocument < DedalusSDK::Internal::Type::BaseModel
      # @!attribute document_url
      #   Data URI with base64-encoded document
      #
      #   @return [String]
      required :document_url, String

      # @!attribute type
      #
      #   @return [String, nil]
      optional :type, String

      # @!method initialize(document_url:, type: nil)
      #   Document input for OCR.
      #
      #   @param document_url [String] Data URI with base64-encoded document
      #
      #   @param type [String]
    end
  end
end
