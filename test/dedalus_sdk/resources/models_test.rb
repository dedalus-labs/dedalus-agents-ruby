# frozen_string_literal: true

require_relative "../test_helper"

class DedalusSDK::Test::Resources::ModelsTest < DedalusSDK::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @dedalus.models.retrieve("model_id")

    assert_pattern do
      response => DedalusSDK::Model
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        provider: DedalusSDK::Model::Provider,
        capabilities: DedalusSDK::Model::Capabilities | nil,
        defaults: DedalusSDK::Model::Defaults | nil,
        description: String | nil,
        display_name: String | nil,
        provider_declared_generation_methods: ^(DedalusSDK::Internal::Type::ArrayOf[String]) | nil,
        provider_info: ^(DedalusSDK::Internal::Type::HashOf[DedalusSDK::Internal::Type::Unknown]) | nil,
        version: String | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @dedalus.models.list

    assert_pattern do
      response => DedalusSDK::ListModelsResponse
    end

    assert_pattern do
      response => {
        data: ^(DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Model]),
        object: DedalusSDK::ListModelsResponse::Object | nil
      }
    end
  end
end
