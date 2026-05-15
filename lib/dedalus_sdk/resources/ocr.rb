# frozen_string_literal: true

module DedalusSDK
  module Resources
    class OCR
      # Process a document through Mistral OCR.
      #
      # Extracts text from PDFs and images, returning markdown-formatted content.
      #
      # @overload process(document:, model: nil, request_options: {})
      #
      # @param document [DedalusSDK::Models::OCRDocument] Document input for OCR.
      #
      # @param model [String]
      #
      # @param request_options [DedalusSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [DedalusSDK::Models::OCRResponse]
      #
      # @see DedalusSDK::Models::OCRProcessParams
      def process(params)
        parsed, options = DedalusSDK::OCRProcessParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/ocr",
          body: parsed,
          model: DedalusSDK::OCRResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [DedalusSDK::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
