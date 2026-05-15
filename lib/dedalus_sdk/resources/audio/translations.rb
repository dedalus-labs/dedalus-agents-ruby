# frozen_string_literal: true

module DedalusSDK
  module Resources
    class Audio
      class Translations
        # Translate audio into English.
        #
        # Translates audio files in any supported language to English text using OpenAI's
        # Whisper model. Supports the same audio formats as transcription. Maximum file
        # size is 25 MB.
        #
        # Args: file: Audio file to translate (required) model: Model ID to use (e.g.,
        # "openai/whisper-1") prompt: Optional text to guide the model's style
        # response_format: Format of the output (json, text, srt, verbose_json, vtt)
        # temperature: Sampling temperature between 0 and 1
        #
        # Returns: Translation object with the English translation
        #
        # @overload create(file:, model:, prompt: nil, response_format: nil, temperature: nil, request_options: {})
        #
        # @param file [Pathname, StringIO, IO, String, DedalusSDK::FilePart]
        # @param model [String]
        # @param prompt [String, nil]
        # @param response_format [String, nil]
        # @param temperature [Float, nil]
        # @param request_options [DedalusSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [DedalusSDK::Models::Audio::TranslationCreateResponse::CreateTranslationResponseVerboseJSON, DedalusSDK::Models::Audio::TranslationCreateResponse::CreateTranslationResponseJSON]
        #
        # @see DedalusSDK::Models::Audio::TranslationCreateParams
        def create(params)
          parsed, options = DedalusSDK::Audio::TranslationCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "v1/audio/translations",
            headers: {"content-type" => "multipart/form-data"},
            body: parsed,
            model: DedalusSDK::Models::Audio::TranslationCreateResponse,
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
