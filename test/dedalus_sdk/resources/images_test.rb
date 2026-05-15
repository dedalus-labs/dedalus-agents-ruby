# frozen_string_literal: true

require_relative "../test_helper"

class DedalusSDK::Test::Resources::ImagesTest < DedalusSDK::Test::ResourceTest
  def test_create_variation_required_params
    skip("Mock server tests are disabled")

    response = @dedalus.images.create_variation(image: StringIO.new("Example data"))

    assert_pattern do
      response => DedalusSDK::ImagesResponse
    end

    assert_pattern do
      response => {
        created: Integer,
        data: ^(DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Image])
      }
    end
  end

  def test_edit_required_params
    skip("Mock server tests are disabled")

    response = @dedalus.images.edit(image: StringIO.new("Example data"), prompt: "prompt")

    assert_pattern do
      response => DedalusSDK::ImagesResponse
    end

    assert_pattern do
      response => {
        created: Integer,
        data: ^(DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Image])
      }
    end
  end

  def test_generate_required_params
    skip("Mock server tests are disabled")

    response = @dedalus.images.generate(prompt: "A white siamese cat")

    assert_pattern do
      response => DedalusSDK::ImagesResponse
    end

    assert_pattern do
      response => {
        created: Integer,
        data: ^(DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Image])
      }
    end
  end
end
