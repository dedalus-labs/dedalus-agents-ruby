# typed: strong

module DedalusSDK
  module Models
    module Audio
      class SpeechCreateParams < DedalusSDK::Internal::Type::BaseModel
        extend DedalusSDK::Internal::Type::RequestParameters::Converter
        include DedalusSDK::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::Audio::SpeechCreateParams,
              DedalusSDK::Internal::AnyHash
            )
          end

        # The text to generate audio for. The maximum length is 4096 characters.
        sig { returns(String) }
        attr_accessor :input

        # One of the available [TTS models](/docs/models#tts): `tts-1`, `tts-1-hd`,
        # `gpt-4o-mini-tts`, or `gpt-4o-mini-tts-2025-12-15`.
        sig do
          returns(
            T.any(
              String,
              DedalusSDK::Audio::SpeechCreateParams::Model::OrSymbol
            )
          )
        end
        attr_accessor :model

        # The voice to use when generating the audio. Supported built-in voices are
        # `alloy`, `ash`, `ballad`, `coral`, `echo`, `fable`, `onyx`, `nova`, `sage`,
        # `shimmer`, `verse`, `marin`, and `cedar`. You may also provide a custom voice
        # object with an `id`, for example `{ "id": "voice_1234" }`. Previews of the
        # voices are available in the
        # [Text to speech guide](/docs/guides/text-to-speech#voice-options).
        sig do
          returns(
            T.any(
              String,
              DedalusSDK::Audio::SpeechCreateParams::Voice::OrSymbol,
              DedalusSDK::VoiceIDsOrCustomVoice
            )
          )
        end
        attr_accessor :voice

        # Control the voice of your generated audio with additional instructions. Does not
        # work with `tts-1` or `tts-1-hd`.
        sig { returns(T.nilable(String)) }
        attr_reader :instructions

        sig { params(instructions: String).void }
        attr_writer :instructions

        # The format to audio in. Supported formats are `mp3`, `opus`, `aac`, `flac`,
        # `wav`, and `pcm`.
        sig do
          returns(
            T.nilable(
              DedalusSDK::Audio::SpeechCreateParams::ResponseFormat::OrSymbol
            )
          )
        end
        attr_reader :response_format

        sig do
          params(
            response_format:
              DedalusSDK::Audio::SpeechCreateParams::ResponseFormat::OrSymbol
          ).void
        end
        attr_writer :response_format

        # The speed of the generated audio. Select a value from `0.25` to `4.0`. `1.0` is
        # the default.
        sig { returns(T.nilable(Float)) }
        attr_reader :speed

        sig { params(speed: Float).void }
        attr_writer :speed

        # The format to stream the audio in. Supported formats are `sse` and `audio`.
        # `sse` is not supported for `tts-1` or `tts-1-hd`.
        sig do
          returns(
            T.nilable(
              DedalusSDK::Audio::SpeechCreateParams::StreamFormat::OrSymbol
            )
          )
        end
        attr_reader :stream_format

        sig do
          params(
            stream_format:
              DedalusSDK::Audio::SpeechCreateParams::StreamFormat::OrSymbol
          ).void
        end
        attr_writer :stream_format

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
          ).returns(T.attached_class)
        end
        def self.new(
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

        sig do
          override.returns(
            {
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
                  DedalusSDK::VoiceIDsOrCustomVoice
                ),
              instructions: String,
              response_format:
                DedalusSDK::Audio::SpeechCreateParams::ResponseFormat::OrSymbol,
              speed: Float,
              stream_format:
                DedalusSDK::Audio::SpeechCreateParams::StreamFormat::OrSymbol,
              request_options: DedalusSDK::RequestOptions
            }
          )
        end
        def to_hash
        end

        # One of the available [TTS models](/docs/models#tts): `tts-1`, `tts-1-hd`,
        # `gpt-4o-mini-tts`, or `gpt-4o-mini-tts-2025-12-15`.
        module Model
          extend DedalusSDK::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                String,
                DedalusSDK::Audio::SpeechCreateParams::Model::TaggedSymbol
              )
            end

          sig do
            override.returns(
              T::Array[DedalusSDK::Audio::SpeechCreateParams::Model::Variants]
            )
          end
          def self.variants
          end

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, DedalusSDK::Audio::SpeechCreateParams::Model)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TTS_1 =
            T.let(
              :"tts-1",
              DedalusSDK::Audio::SpeechCreateParams::Model::TaggedSymbol
            )
          TTS_1_HD =
            T.let(
              :"tts-1-hd",
              DedalusSDK::Audio::SpeechCreateParams::Model::TaggedSymbol
            )
          GPT_4O_MINI_TTS =
            T.let(
              :"gpt-4o-mini-tts",
              DedalusSDK::Audio::SpeechCreateParams::Model::TaggedSymbol
            )
          GPT_4O_MINI_TTS_2025_12_15 =
            T.let(
              :"gpt-4o-mini-tts-2025-12-15",
              DedalusSDK::Audio::SpeechCreateParams::Model::TaggedSymbol
            )
        end

        # The voice to use when generating the audio. Supported built-in voices are
        # `alloy`, `ash`, `ballad`, `coral`, `echo`, `fable`, `onyx`, `nova`, `sage`,
        # `shimmer`, `verse`, `marin`, and `cedar`. You may also provide a custom voice
        # object with an `id`, for example `{ "id": "voice_1234" }`. Previews of the
        # voices are available in the
        # [Text to speech guide](/docs/guides/text-to-speech#voice-options).
        module Voice
          extend DedalusSDK::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                String,
                DedalusSDK::Audio::SpeechCreateParams::Voice::TaggedSymbol,
                DedalusSDK::VoiceIDsOrCustomVoice
              )
            end

          sig do
            override.returns(
              T::Array[DedalusSDK::Audio::SpeechCreateParams::Voice::Variants]
            )
          end
          def self.variants
          end

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, DedalusSDK::Audio::SpeechCreateParams::Voice)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ALLOY =
            T.let(
              :alloy,
              DedalusSDK::Audio::SpeechCreateParams::Voice::TaggedSymbol
            )
          ASH =
            T.let(
              :ash,
              DedalusSDK::Audio::SpeechCreateParams::Voice::TaggedSymbol
            )
          BALLAD =
            T.let(
              :ballad,
              DedalusSDK::Audio::SpeechCreateParams::Voice::TaggedSymbol
            )
          CORAL =
            T.let(
              :coral,
              DedalusSDK::Audio::SpeechCreateParams::Voice::TaggedSymbol
            )
          ECHO =
            T.let(
              :echo,
              DedalusSDK::Audio::SpeechCreateParams::Voice::TaggedSymbol
            )
          SAGE =
            T.let(
              :sage,
              DedalusSDK::Audio::SpeechCreateParams::Voice::TaggedSymbol
            )
          SHIMMER =
            T.let(
              :shimmer,
              DedalusSDK::Audio::SpeechCreateParams::Voice::TaggedSymbol
            )
          VERSE =
            T.let(
              :verse,
              DedalusSDK::Audio::SpeechCreateParams::Voice::TaggedSymbol
            )
          MARIN =
            T.let(
              :marin,
              DedalusSDK::Audio::SpeechCreateParams::Voice::TaggedSymbol
            )
          CEDAR =
            T.let(
              :cedar,
              DedalusSDK::Audio::SpeechCreateParams::Voice::TaggedSymbol
            )
        end

        # The format to audio in. Supported formats are `mp3`, `opus`, `aac`, `flac`,
        # `wav`, and `pcm`.
        module ResponseFormat
          extend DedalusSDK::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                DedalusSDK::Audio::SpeechCreateParams::ResponseFormat
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MP3 =
            T.let(
              :mp3,
              DedalusSDK::Audio::SpeechCreateParams::ResponseFormat::TaggedSymbol
            )
          OPUS =
            T.let(
              :opus,
              DedalusSDK::Audio::SpeechCreateParams::ResponseFormat::TaggedSymbol
            )
          AAC =
            T.let(
              :aac,
              DedalusSDK::Audio::SpeechCreateParams::ResponseFormat::TaggedSymbol
            )
          FLAC =
            T.let(
              :flac,
              DedalusSDK::Audio::SpeechCreateParams::ResponseFormat::TaggedSymbol
            )
          WAV =
            T.let(
              :wav,
              DedalusSDK::Audio::SpeechCreateParams::ResponseFormat::TaggedSymbol
            )
          PCM =
            T.let(
              :pcm,
              DedalusSDK::Audio::SpeechCreateParams::ResponseFormat::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                DedalusSDK::Audio::SpeechCreateParams::ResponseFormat::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The format to stream the audio in. Supported formats are `sse` and `audio`.
        # `sse` is not supported for `tts-1` or `tts-1-hd`.
        module StreamFormat
          extend DedalusSDK::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, DedalusSDK::Audio::SpeechCreateParams::StreamFormat)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SSE =
            T.let(
              :sse,
              DedalusSDK::Audio::SpeechCreateParams::StreamFormat::TaggedSymbol
            )
          AUDIO =
            T.let(
              :audio,
              DedalusSDK::Audio::SpeechCreateParams::StreamFormat::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                DedalusSDK::Audio::SpeechCreateParams::StreamFormat::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
