# frozen_string_literal: true

require_relative "../test_helper"

class DedalusSDK::Test::Resources::EmbeddingsTest < DedalusSDK::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @dedalus.embeddings.create(input: "string", model: :"text-embedding-ada-002")

    assert_pattern do
      response => DedalusSDK::CreateEmbeddingResponse
    end

    assert_pattern do
      response => {
        data: ^(DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::CreateEmbeddingResponse::Data]),
        model: String,
        object: Symbol,
        usage: DedalusSDK::CreateEmbeddingResponse::Usage
      }
    end
  end
end
