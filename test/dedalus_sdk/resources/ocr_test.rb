# frozen_string_literal: true

require_relative "../test_helper"

class DedalusSDK::Test::Resources::OCRTest < DedalusSDK::Test::ResourceTest
  def test_process_required_params
    skip("Mock server tests are disabled")

    response = @dedalus.ocr.process(document: {document_url: "document_url"})

    assert_pattern do
      response => DedalusSDK::OCRResponse
    end

    assert_pattern do
      response => {
        model: String,
        pages: ^(DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::OCRPage]),
        usage: ^(DedalusSDK::Internal::Type::HashOf[DedalusSDK::Internal::Type::Unknown]) | nil
      }
    end
  end
end
