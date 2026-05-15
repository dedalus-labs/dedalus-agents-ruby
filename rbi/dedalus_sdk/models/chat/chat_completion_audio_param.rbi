# typed: strong

module DedalusSDK
  module Models
    ChatCompletionAudioParam = Chat::ChatCompletionAudioParam

    module Chat
      class ChatCompletionAudioParam < DedalusSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::Chat::ChatCompletionAudioParam,
              DedalusSDK::Internal::AnyHash
            )
          end

        # Specifies the output audio format. Must be one of `wav`, `mp3`, `flac`, `opus`,
        # or `pcm16`.
        sig do
          returns(DedalusSDK::Chat::ChatCompletionAudioParam::Format::OrSymbol)
        end
        attr_accessor :format_

        # The voice the model uses to respond. Supported built-in voices are `alloy`,
        # `ash`, `ballad`, `coral`, `echo`, `fable`, `nova`, `onyx`, `sage`, `shimmer`,
        # `marin`, and `cedar`. You may also provide a custom voice object with an `id`,
        # for example `{ "id": "voice_1234" }`.
        sig do
          returns(
            T.any(
              String,
              DedalusSDK::Chat::ChatCompletionAudioParam::Voice::OrSymbol,
              DedalusSDK::VoiceIDsOrCustomVoice
            )
          )
        end
        attr_accessor :voice

        # Parameters for audio output. Required when audio output is requested with
        # `modalities: ["audio"]`. [Learn more](/docs/guides/audio).
        #
        # Fields:
        #
        # - voice (required): VoiceIdsOrCustomVoice
        # - format (required): Literal["wav", "aac", "mp3", "flac", "opus", "pcm16"]
        sig do
          params(
            format_:
              DedalusSDK::Chat::ChatCompletionAudioParam::Format::OrSymbol,
            voice:
              T.any(
                String,
                DedalusSDK::Chat::ChatCompletionAudioParam::Voice::OrSymbol,
                DedalusSDK::VoiceIDsOrCustomVoice::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # Specifies the output audio format. Must be one of `wav`, `mp3`, `flac`, `opus`,
          # or `pcm16`.
          format_:,
          # The voice the model uses to respond. Supported built-in voices are `alloy`,
          # `ash`, `ballad`, `coral`, `echo`, `fable`, `nova`, `onyx`, `sage`, `shimmer`,
          # `marin`, and `cedar`. You may also provide a custom voice object with an `id`,
          # for example `{ "id": "voice_1234" }`.
          voice:
        )
        end

        sig do
          override.returns(
            {
              format_:
                DedalusSDK::Chat::ChatCompletionAudioParam::Format::OrSymbol,
              voice:
                T.any(
                  String,
                  DedalusSDK::Chat::ChatCompletionAudioParam::Voice::OrSymbol,
                  DedalusSDK::VoiceIDsOrCustomVoice
                )
            }
          )
        end
        def to_hash
        end

        # Specifies the output audio format. Must be one of `wav`, `mp3`, `flac`, `opus`,
        # or `pcm16`.
        module Format
          extend DedalusSDK::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, DedalusSDK::Chat::ChatCompletionAudioParam::Format)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          WAV =
            T.let(
              :wav,
              DedalusSDK::Chat::ChatCompletionAudioParam::Format::TaggedSymbol
            )
          AAC =
            T.let(
              :aac,
              DedalusSDK::Chat::ChatCompletionAudioParam::Format::TaggedSymbol
            )
          MP3 =
            T.let(
              :mp3,
              DedalusSDK::Chat::ChatCompletionAudioParam::Format::TaggedSymbol
            )
          FLAC =
            T.let(
              :flac,
              DedalusSDK::Chat::ChatCompletionAudioParam::Format::TaggedSymbol
            )
          OPUS =
            T.let(
              :opus,
              DedalusSDK::Chat::ChatCompletionAudioParam::Format::TaggedSymbol
            )
          PCM16 =
            T.let(
              :pcm16,
              DedalusSDK::Chat::ChatCompletionAudioParam::Format::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                DedalusSDK::Chat::ChatCompletionAudioParam::Format::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The voice the model uses to respond. Supported built-in voices are `alloy`,
        # `ash`, `ballad`, `coral`, `echo`, `fable`, `nova`, `onyx`, `sage`, `shimmer`,
        # `marin`, and `cedar`. You may also provide a custom voice object with an `id`,
        # for example `{ "id": "voice_1234" }`.
        module Voice
          extend DedalusSDK::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                String,
                DedalusSDK::Chat::ChatCompletionAudioParam::Voice::TaggedSymbol,
                DedalusSDK::VoiceIDsOrCustomVoice
              )
            end

          sig do
            override.returns(
              T::Array[
                DedalusSDK::Chat::ChatCompletionAudioParam::Voice::Variants
              ]
            )
          end
          def self.variants
          end

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, DedalusSDK::Chat::ChatCompletionAudioParam::Voice)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ALLOY =
            T.let(
              :alloy,
              DedalusSDK::Chat::ChatCompletionAudioParam::Voice::TaggedSymbol
            )
          ASH =
            T.let(
              :ash,
              DedalusSDK::Chat::ChatCompletionAudioParam::Voice::TaggedSymbol
            )
          BALLAD =
            T.let(
              :ballad,
              DedalusSDK::Chat::ChatCompletionAudioParam::Voice::TaggedSymbol
            )
          CORAL =
            T.let(
              :coral,
              DedalusSDK::Chat::ChatCompletionAudioParam::Voice::TaggedSymbol
            )
          ECHO =
            T.let(
              :echo,
              DedalusSDK::Chat::ChatCompletionAudioParam::Voice::TaggedSymbol
            )
          SAGE =
            T.let(
              :sage,
              DedalusSDK::Chat::ChatCompletionAudioParam::Voice::TaggedSymbol
            )
          SHIMMER =
            T.let(
              :shimmer,
              DedalusSDK::Chat::ChatCompletionAudioParam::Voice::TaggedSymbol
            )
          VERSE =
            T.let(
              :verse,
              DedalusSDK::Chat::ChatCompletionAudioParam::Voice::TaggedSymbol
            )
          MARIN =
            T.let(
              :marin,
              DedalusSDK::Chat::ChatCompletionAudioParam::Voice::TaggedSymbol
            )
          CEDAR =
            T.let(
              :cedar,
              DedalusSDK::Chat::ChatCompletionAudioParam::Voice::TaggedSymbol
            )
        end
      end
    end
  end
end
