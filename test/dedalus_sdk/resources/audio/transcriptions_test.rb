# frozen_string_literal: true

require_relative "../../test_helper"

class DedalusSDK::Test::Resources::Audio::TranscriptionsTest < DedalusSDK::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @dedalus.audio.transcriptions.create(file: StringIO.new("Example data"), model: "model")

    assert_pattern do
      response => DedalusSDK::Models::Audio::TranscriptionCreateResponse
    end

    assert_pattern do
      case response
      in DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON
      in DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON
      end
    end
  end
end
