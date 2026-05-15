# typed: strong

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
        sig do
          params(
            file: DedalusSDK::Internal::FileInput,
            model: String,
            language: T.nilable(String),
            prompt: T.nilable(String),
            response_format: T.nilable(String),
            temperature: T.nilable(Float),
            request_options: DedalusSDK::RequestOptions::OrHash
          ).returns(
            DedalusSDK::Models::Audio::TranscriptionCreateResponse::Variants
          )
        end
        def create(
          file:,
          model:,
          language: nil,
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
