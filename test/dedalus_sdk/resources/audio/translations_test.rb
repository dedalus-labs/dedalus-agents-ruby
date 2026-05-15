# frozen_string_literal: true

require_relative "../../test_helper"

class DedalusSDK::Test::Resources::Audio::TranslationsTest < DedalusSDK::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @dedalus.audio.translations.create(file: StringIO.new("Example data"), model: "model")

    assert_pattern do
      response => DedalusSDK::Models::Audio::TranslationCreateResponse
    end

    assert_pattern do
      case response
      in DedalusSDK::Models::Audio::TranslationCreateResponse::CreateTranslationResponseVerboseJSON
      in DedalusSDK::Models::Audio::TranslationCreateResponse::CreateTranslationResponseJSON
      end
    end
  end
end
