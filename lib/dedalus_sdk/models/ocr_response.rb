# frozen_string_literal: true

module DedalusSDK
  module Models
    # @see DedalusSDK::Resources::OCR#process
    class OCRResponse < DedalusSDK::Internal::Type::BaseModel
      # @!attribute model
      #
      #   @return [String]
      required :model, String

      # @!attribute pages
      #
      #   @return [Array<DedalusSDK::Models::OCRPage>]
      required :pages, -> { DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::OCRPage] }

      # @!attribute usage
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :usage, DedalusSDK::Internal::Type::HashOf[DedalusSDK::Internal::Type::Unknown], nil?: true

      # @!method initialize(model:, pages:, usage: nil)
      #   OCR response schema.
      #
      #   @param model [String]
      #   @param pages [Array<DedalusSDK::Models::OCRPage>]
      #   @param usage [Hash{Symbol=>Object}, nil]
    end
  end
end
