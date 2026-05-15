# frozen_string_literal: true

module DedalusSDK
  module Models
    class OCRPage < DedalusSDK::Internal::Type::BaseModel
      # @!attribute index
      #
      #   @return [Integer]
      required :index, Integer

      # @!attribute markdown
      #
      #   @return [String]
      required :markdown, String

      # @!method initialize(index:, markdown:)
      #   Single page OCR result.
      #
      #   @param index [Integer]
      #   @param markdown [String]
    end
  end
end
