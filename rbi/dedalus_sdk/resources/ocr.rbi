# typed: strong

module DedalusSDK
  module Resources
    class OCR
      # Process a document through Mistral OCR.
      #
      # Extracts text from PDFs and images, returning markdown-formatted content.
      sig do
        params(
          document: DedalusSDK::OCRDocument::OrHash,
          model: String,
          request_options: DedalusSDK::RequestOptions::OrHash
        ).returns(DedalusSDK::OCRResponse)
      end
      def process(
        # Document input for OCR.
        document:,
        model: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: DedalusSDK::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
