# frozen_string_literal: true

module DedalusSDK
  module Models
    # @see DedalusSDK::Resources::OCR#process
    class OCRProcessParams < DedalusSDK::Models::OCRRequest
      extend DedalusSDK::Internal::Type::RequestParameters::Converter
      include DedalusSDK::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [DedalusSDK::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
