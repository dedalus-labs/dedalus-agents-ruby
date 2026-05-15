# frozen_string_literal: true

module DedalusSDK
  module Models
    module Audio
      # @see DedalusSDK::Resources::Audio::Speech#create
      class SpeechCreateParams < DedalusSDK::Internal::Type::BaseModel
        extend DedalusSDK::Internal::Type::RequestParameters::Converter
        include DedalusSDK::Internal::Type::RequestParameters

        # @!attribute input
        #   The text to generate audio for. The maximum length is 4096 characters.
        #
        #   @return [String]
        required :input, String

        # @!attribute model
        #   One of the available [TTS models](/docs/models#tts): `tts-1`, `tts-1-hd`,
        #   `gpt-4o-mini-tts`, or `gpt-4o-mini-tts-2025-12-15`.
        #
        #   @return [String, Symbol, DedalusSDK::Models::Audio::SpeechCreateParams::Model]
        required :model, union: -> { DedalusSDK::Audio::SpeechCreateParams::Model }

        # @!attribute voice
        #   The voice to use when generating the audio. Supported built-in voices are
        #   `alloy`, `ash`, `ballad`, `coral`, `echo`, `fable`, `onyx`, `nova`, `sage`,
        #   `shimmer`, `verse`, `marin`, and `cedar`. You may also provide a custom voice
        #   object with an `id`, for example `{ "id": "voice_1234" }`. Previews of the
        #   voices are available in the
        #   [Text to speech guide](/docs/guides/text-to-speech#voice-options).
        #
        #   @return [String, Symbol, DedalusSDK::Models::VoiceIDsOrCustomVoice, DedalusSDK::Models::Audio::SpeechCreateParams::Voice]
        required :voice, union: -> { DedalusSDK::Audio::SpeechCreateParams::Voice }

        # @!attribute instructions
        #   Control the voice of your generated audio with additional instructions. Does not
        #   work with `tts-1` or `tts-1-hd`.
        #
        #   @return [String, nil]
        optional :instructions, String

        # @!attribute response_format
        #   The format to audio in. Supported formats are `mp3`, `opus`, `aac`, `flac`,
        #   `wav`, and `pcm`.
        #
        #   @return [Symbol, DedalusSDK::Models::Audio::SpeechCreateParams::ResponseFormat, nil]
        optional :response_format, enum: -> { DedalusSDK::Audio::SpeechCreateParams::ResponseFormat }

        # @!attribute speed
        #   The speed of the generated audio. Select a value from `0.25` to `4.0`. `1.0` is
        #   the default.
        #
        #   @return [Float, nil]
        optional :speed, Float

        # @!attribute stream_format
        #   The format to stream the audio in. Supported formats are `sse` and `audio`.
        #   `sse` is not supported for `tts-1` or `tts-1-hd`.
        #
        #   @return [Symbol, DedalusSDK::Models::Audio::SpeechCreateParams::StreamFormat, nil]
        optional :stream_format, enum: -> { DedalusSDK::Audio::SpeechCreateParams::StreamFormat }

        # @!method initialize(input:, model:, voice:, instructions: nil, response_format: nil, speed: nil, stream_format: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {DedalusSDK::Models::Audio::SpeechCreateParams} for more details.
        #
        #   @param input [String] The text to generate audio for. The maximum length is 4096 characters.
        #
        #   @param model [String, Symbol, DedalusSDK::Models::Audio::SpeechCreateParams::Model] One of the available [TTS models](/docs/models#tts): `tts-1`, `tts-1-hd`, `gpt-4
        #
        #   @param voice [String, Symbol, DedalusSDK::Models::VoiceIDsOrCustomVoice, DedalusSDK::Models::Audio::SpeechCreateParams::Voice] The voice to use when generating the audio. Supported built-in voices are `alloy
        #
        #   @param instructions [String] Control the voice of your generated audio with additional instructions. Does not
        #
        #   @param response_format [Symbol, DedalusSDK::Models::Audio::SpeechCreateParams::ResponseFormat] The format to audio in. Supported formats are `mp3`, `opus`, `aac`, `flac`, `wav
        #
        #   @param speed [Float] The speed of the generated audio. Select a value from `0.25` to `4.0`. `1.0` is
        #
        #   @param stream_format [Symbol, DedalusSDK::Models::Audio::SpeechCreateParams::StreamFormat] The format to stream the audio in. Supported formats are `sse` and `audio`. `sse
        #
        #   @param request_options [DedalusSDK::RequestOptions, Hash{Symbol=>Object}]

        # One of the available [TTS models](/docs/models#tts): `tts-1`, `tts-1-hd`,
        # `gpt-4o-mini-tts`, or `gpt-4o-mini-tts-2025-12-15`.
        module Model
          extend DedalusSDK::Internal::Type::Union

          variant String

          variant const: -> { DedalusSDK::Models::Audio::SpeechCreateParams::Model::TTS_1 }

          variant const: -> { DedalusSDK::Models::Audio::SpeechCreateParams::Model::TTS_1_HD }

          variant const: -> { DedalusSDK::Models::Audio::SpeechCreateParams::Model::GPT_4O_MINI_TTS }

          variant const: -> { DedalusSDK::Models::Audio::SpeechCreateParams::Model::GPT_4O_MINI_TTS_2025_12_15 }

          # @!method self.variants
          #   @return [Array(String, Symbol)]

          define_sorbet_constant!(:Variants) do
            T.type_alias { T.any(String, DedalusSDK::Audio::SpeechCreateParams::Model::TaggedSymbol) }
          end

          # @!group

          TTS_1 = :"tts-1"
          TTS_1_HD = :"tts-1-hd"
          GPT_4O_MINI_TTS = :"gpt-4o-mini-tts"
          GPT_4O_MINI_TTS_2025_12_15 = :"gpt-4o-mini-tts-2025-12-15"

          # @!endgroup
        end

        # The voice to use when generating the audio. Supported built-in voices are
        # `alloy`, `ash`, `ballad`, `coral`, `echo`, `fable`, `onyx`, `nova`, `sage`,
        # `shimmer`, `verse`, `marin`, and `cedar`. You may also provide a custom voice
        # object with an `id`, for example `{ "id": "voice_1234" }`. Previews of the
        # voices are available in the
        # [Text to speech guide](/docs/guides/text-to-speech#voice-options).
        module Voice
          extend DedalusSDK::Internal::Type::Union

          variant String

          variant const: -> { DedalusSDK::Models::Audio::SpeechCreateParams::Voice::ALLOY }

          variant const: -> { DedalusSDK::Models::Audio::SpeechCreateParams::Voice::ASH }

          variant const: -> { DedalusSDK::Models::Audio::SpeechCreateParams::Voice::BALLAD }

          variant const: -> { DedalusSDK::Models::Audio::SpeechCreateParams::Voice::CORAL }

          variant const: -> { DedalusSDK::Models::Audio::SpeechCreateParams::Voice::ECHO }

          variant const: -> { DedalusSDK::Models::Audio::SpeechCreateParams::Voice::SAGE }

          variant const: -> { DedalusSDK::Models::Audio::SpeechCreateParams::Voice::SHIMMER }

          variant const: -> { DedalusSDK::Models::Audio::SpeechCreateParams::Voice::VERSE }

          variant const: -> { DedalusSDK::Models::Audio::SpeechCreateParams::Voice::MARIN }

          variant const: -> { DedalusSDK::Models::Audio::SpeechCreateParams::Voice::CEDAR }

          # Custom voice reference.
          #
          # Fields:
          # - id (required): str
          variant -> { DedalusSDK::VoiceIDsOrCustomVoice }

          # @!method self.variants
          #   @return [Array(String, Symbol, DedalusSDK::Models::VoiceIDsOrCustomVoice)]

          define_sorbet_constant!(:Variants) do
            T.type_alias do
              T.any(
                String,
                DedalusSDK::Audio::SpeechCreateParams::Voice::TaggedSymbol,
                DedalusSDK::VoiceIDsOrCustomVoice
              )
            end
          end

          # @!group

          ALLOY = :alloy
          ASH = :ash
          BALLAD = :ballad
          CORAL = :coral
          ECHO = :echo
          SAGE = :sage
          SHIMMER = :shimmer
          VERSE = :verse
          MARIN = :marin
          CEDAR = :cedar

          # @!endgroup
        end

        # The format to audio in. Supported formats are `mp3`, `opus`, `aac`, `flac`,
        # `wav`, and `pcm`.
        module ResponseFormat
          extend DedalusSDK::Internal::Type::Enum

          MP3 = :mp3
          OPUS = :opus
          AAC = :aac
          FLAC = :flac
          WAV = :wav
          PCM = :pcm

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The format to stream the audio in. Supported formats are `sse` and `audio`.
        # `sse` is not supported for `tts-1` or `tts-1-hd`.
        module StreamFormat
          extend DedalusSDK::Internal::Type::Enum

          SSE = :sse
          AUDIO = :audio

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
