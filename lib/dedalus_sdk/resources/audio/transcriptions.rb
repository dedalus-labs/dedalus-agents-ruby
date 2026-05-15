# frozen_string_literal: true

module DedalusSDK
  module Resources
    class Audio
      class Transcriptions
        # Transcribe audio into text.
        #
        # Transcribes audio files using OpenAI's Whisper model. Supports multiple audio
        # formats including mp3, mp4, mpeg, mpga, m4a, wav, and webm. Maximum file size is
        # 25 MB.
        #
        # Args: file: Audio file to transcribe (required) model: Model ID to use (e.g.,
        # "openai/whisper-1") language: ISO-639-1 language code (e.g., "en", "es") -
        # improves accuracy prompt: Optional text to guide the model's style
        # response_format: Format of the output (json, text, srt, verbose_json, vtt)
        # temperature: Sampling temperature between 0 and 1
        #
        # Returns: Transcription object with the transcribed text
        #
        # @overload create(file:, model:, language: nil, prompt: nil, response_format: nil, temperature: nil, request_options: {})
        #
        # @param file [Pathname, StringIO, IO, String, DedalusSDK::FilePart]
        # @param model [String]
        # @param language [String, nil]
        # @param prompt [String, nil]
        # @param response_format [String, nil]
        # @param temperature [Float, nil]
        # @param request_options [DedalusSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON, DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON]
        #
        # @see DedalusSDK::Models::Audio::TranscriptionCreateParams
        def create(params)
          parsed, options = DedalusSDK::Audio::TranscriptionCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "v1/audio/transcriptions",
            headers: {"content-type" => "multipart/form-data"},
            body: parsed,
            model: DedalusSDK::Models::Audio::TranscriptionCreateResponse,
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
end
