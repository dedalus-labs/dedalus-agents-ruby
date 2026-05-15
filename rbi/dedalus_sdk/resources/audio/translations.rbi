# typed: strong

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
        sig do
          params(
            file: DedalusSDK::Internal::FileInput,
            model: String,
            prompt: T.nilable(String),
            response_format: T.nilable(String),
            temperature: T.nilable(Float),
            request_options: DedalusSDK::RequestOptions::OrHash
          ).returns(
            DedalusSDK::Models::Audio::TranslationCreateResponse::Variants
          )
        end
        def create(
          file:,
          model:,
          prompt: nil,
          response_format: nil,
          temperature: nil,
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
end
