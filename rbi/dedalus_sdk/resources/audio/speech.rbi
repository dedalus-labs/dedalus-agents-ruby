# typed: strong

module DedalusSDK
  module Resources
    class Audio
      class Speech
        # Generate speech audio from text.
        #
        # Generates audio from the input text using text-to-speech models. Supports
        # multiple voices and output formats including mp3, opus, aac, flac, wav, and pcm.
        #
        # Returns streaming audio data that can be saved to a file or streamed directly to
        # users.
        sig do
          params(
            input: String,
            model:
              T.any(
                String,
                DedalusSDK::Audio::SpeechCreateParams::Model::OrSymbol
              ),
            voice:
              T.any(
                String,
                DedalusSDK::Audio::SpeechCreateParams::Voice::OrSymbol,
                DedalusSDK::VoiceIDsOrCustomVoice::OrHash
              ),
            instructions: String,
            response_format:
              DedalusSDK::Audio::SpeechCreateParams::ResponseFormat::OrSymbol,
            speed: Float,
            stream_format:
              DedalusSDK::Audio::SpeechCreateParams::StreamFormat::OrSymbol,
            request_options: DedalusSDK::RequestOptions::OrHash
          ).returns(StringIO)
        end
        def create(
          # The text to generate audio for. The maximum length is 4096 characters.
          input:,
          # One of the available [TTS models](/docs/models#tts): `tts-1`, `tts-1-hd`,
          # `gpt-4o-mini-tts`, or `gpt-4o-mini-tts-2025-12-15`.
          model:,
          # The voice to use when generating the audio. Supported built-in voices are
          # `alloy`, `ash`, `ballad`, `coral`, `echo`, `fable`, `onyx`, `nova`, `sage`,
          # `shimmer`, `verse`, `marin`, and `cedar`. You may also provide a custom voice
          # object with an `id`, for example `{ "id": "voice_1234" }`. Previews of the
          # voices are available in the
          # [Text to speech guide](/docs/guides/text-to-speech#voice-options).
          voice:,
          # Control the voice of your generated audio with additional instructions. Does not
          # work with `tts-1` or `tts-1-hd`.
          instructions: nil,
          # The format to audio in. Supported formats are `mp3`, `opus`, `aac`, `flac`,
          # `wav`, and `pcm`.
          response_format: nil,
          # The speed of the generated audio. Select a value from `0.25` to `4.0`. `1.0` is
          # the default.
          speed: nil,
          # The format to stream the audio in. Supported formats are `sse` and `audio`.
          # `sse` is not supported for `tts-1` or `tts-1-hd`.
          stream_format: nil,
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
