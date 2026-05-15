# frozen_string_literal: true

require_relative "../../test_helper"

class DedalusSDK::Test::Resources::Audio::SpeechTest < DedalusSDK::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @dedalus.audio.speech.create(input: "input", model: :"tts-1", voice: :alloy)

    assert_pattern do
      response => StringIO
    end
  end
end
