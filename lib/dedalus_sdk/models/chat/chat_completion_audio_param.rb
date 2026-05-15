# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      class ChatCompletionAudioParam < DedalusSDK::Internal::Type::BaseModel
        # @!attribute format_
        #   Specifies the output audio format. Must be one of `wav`, `mp3`, `flac`, `opus`,
        #   or `pcm16`.
        #
        #   @return [Symbol, DedalusSDK::Models::Chat::ChatCompletionAudioParam::Format]
        required :format_, enum: -> { DedalusSDK::Chat::ChatCompletionAudioParam::Format }, api_name: :format

        # @!attribute voice
        #   The voice the model uses to respond. Supported built-in voices are `alloy`,
        #   `ash`, `ballad`, `coral`, `echo`, `fable`, `nova`, `onyx`, `sage`, `shimmer`,
        #   `marin`, and `cedar`. You may also provide a custom voice object with an `id`,
        #   for example `{ "id": "voice_1234" }`.
        #
        #   @return [String, Symbol, DedalusSDK::Models::VoiceIDsOrCustomVoice, DedalusSDK::Models::Chat::ChatCompletionAudioParam::Voice]
        required :voice, union: -> { DedalusSDK::Chat::ChatCompletionAudioParam::Voice }

        # @!method initialize(format_:, voice:)
        #   Some parameter documentations has been truncated, see
        #   {DedalusSDK::Models::Chat::ChatCompletionAudioParam} for more details.
        #
        #   Parameters for audio output. Required when audio output is requested with
        #   `modalities: ["audio"]`. [Learn more](/docs/guides/audio).
        #
        #   Fields:
        #
        #   - voice (required): VoiceIdsOrCustomVoice
        #   - format (required): Literal["wav", "aac", "mp3", "flac", "opus", "pcm16"]
        #
        #   @param format_ [Symbol, DedalusSDK::Models::Chat::ChatCompletionAudioParam::Format] Specifies the output audio format. Must be one of `wav`, `mp3`, `flac`,
        #
        #   @param voice [String, Symbol, DedalusSDK::Models::VoiceIDsOrCustomVoice, DedalusSDK::Models::Chat::ChatCompletionAudioParam::Voice] The voice the model uses to respond. Supported built-in voices are

        # Specifies the output audio format. Must be one of `wav`, `mp3`, `flac`, `opus`,
        # or `pcm16`.
        #
        # @see DedalusSDK::Models::Chat::ChatCompletionAudioParam#format_
        module Format
          extend DedalusSDK::Internal::Type::Enum

          WAV = :wav
          AAC = :aac
          MP3 = :mp3
          FLAC = :flac
          OPUS = :opus
          PCM16 = :pcm16

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The voice the model uses to respond. Supported built-in voices are `alloy`,
        # `ash`, `ballad`, `coral`, `echo`, `fable`, `nova`, `onyx`, `sage`, `shimmer`,
        # `marin`, and `cedar`. You may also provide a custom voice object with an `id`,
        # for example `{ "id": "voice_1234" }`.
        #
        # @see DedalusSDK::Models::Chat::ChatCompletionAudioParam#voice
        module Voice
          extend DedalusSDK::Internal::Type::Union

          variant String

          variant const: -> { DedalusSDK::Models::Chat::ChatCompletionAudioParam::Voice::ALLOY }

          variant const: -> { DedalusSDK::Models::Chat::ChatCompletionAudioParam::Voice::ASH }

          variant const: -> { DedalusSDK::Models::Chat::ChatCompletionAudioParam::Voice::BALLAD }

          variant const: -> { DedalusSDK::Models::Chat::ChatCompletionAudioParam::Voice::CORAL }

          variant const: -> { DedalusSDK::Models::Chat::ChatCompletionAudioParam::Voice::ECHO }

          variant const: -> { DedalusSDK::Models::Chat::ChatCompletionAudioParam::Voice::SAGE }

          variant const: -> { DedalusSDK::Models::Chat::ChatCompletionAudioParam::Voice::SHIMMER }

          variant const: -> { DedalusSDK::Models::Chat::ChatCompletionAudioParam::Voice::VERSE }

          variant const: -> { DedalusSDK::Models::Chat::ChatCompletionAudioParam::Voice::MARIN }

          variant const: -> { DedalusSDK::Models::Chat::ChatCompletionAudioParam::Voice::CEDAR }

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
                DedalusSDK::Chat::ChatCompletionAudioParam::Voice::TaggedSymbol,
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
      end
    end

    ChatCompletionAudioParam = Chat::ChatCompletionAudioParam
  end
end
