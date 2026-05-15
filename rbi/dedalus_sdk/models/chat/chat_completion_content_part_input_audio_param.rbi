# typed: strong

module DedalusSDK
  module Models
    ChatCompletionContentPartInputAudioParam =
      Chat::ChatCompletionContentPartInputAudioParam

    module Chat
      class ChatCompletionContentPartInputAudioParam < DedalusSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::Chat::ChatCompletionContentPartInputAudioParam,
              DedalusSDK::Internal::AnyHash
            )
          end

        # Schema for InputAudio.
        #
        # Fields:
        #
        # - data (required): str
        # - format (required): Literal["wav", "mp3"]
        sig do
          returns(
            DedalusSDK::Chat::ChatCompletionContentPartInputAudioParam::InputAudio
          )
        end
        attr_reader :input_audio

        sig do
          params(
            input_audio:
              DedalusSDK::Chat::ChatCompletionContentPartInputAudioParam::InputAudio::OrHash
          ).void
        end
        attr_writer :input_audio

        # The type of the content part. Always `input_audio`.
        sig { returns(Symbol) }
        attr_accessor :type

        # Learn about [audio inputs](/docs/guides/audio).
        #
        # Fields:
        #
        # - type (required): Literal["input_audio"]
        # - input_audio (required): InputAudio
        sig do
          params(
            input_audio:
              DedalusSDK::Chat::ChatCompletionContentPartInputAudioParam::InputAudio::OrHash,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Schema for InputAudio.
          #
          # Fields:
          #
          # - data (required): str
          # - format (required): Literal["wav", "mp3"]
          input_audio:,
          # The type of the content part. Always `input_audio`.
          type: :input_audio
        )
        end

        sig do
          override.returns(
            {
              input_audio:
                DedalusSDK::Chat::ChatCompletionContentPartInputAudioParam::InputAudio,
              type: Symbol
            }
          )
        end
        def to_hash
        end

        class InputAudio < DedalusSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DedalusSDK::Chat::ChatCompletionContentPartInputAudioParam::InputAudio,
                DedalusSDK::Internal::AnyHash
              )
            end

          # Base64 encoded audio data.
          sig { returns(String) }
          attr_accessor :data

          # The format of the encoded audio data. Currently supports "wav" and "mp3".
          sig do
            returns(
              DedalusSDK::Chat::ChatCompletionContentPartInputAudioParam::InputAudio::Format::OrSymbol
            )
          end
          attr_accessor :format_

          # Schema for InputAudio.
          #
          # Fields:
          #
          # - data (required): str
          # - format (required): Literal["wav", "mp3"]
          sig do
            params(
              data: String,
              format_:
                DedalusSDK::Chat::ChatCompletionContentPartInputAudioParam::InputAudio::Format::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Base64 encoded audio data.
            data:,
            # The format of the encoded audio data. Currently supports "wav" and "mp3".
            format_:
          )
          end

          sig do
            override.returns(
              {
                data: String,
                format_:
                  DedalusSDK::Chat::ChatCompletionContentPartInputAudioParam::InputAudio::Format::OrSymbol
              }
            )
          end
          def to_hash
          end

          # The format of the encoded audio data. Currently supports "wav" and "mp3".
          module Format
            extend DedalusSDK::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  DedalusSDK::Chat::ChatCompletionContentPartInputAudioParam::InputAudio::Format
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            WAV =
              T.let(
                :wav,
                DedalusSDK::Chat::ChatCompletionContentPartInputAudioParam::InputAudio::Format::TaggedSymbol
              )
            MP3 =
              T.let(
                :mp3,
                DedalusSDK::Chat::ChatCompletionContentPartInputAudioParam::InputAudio::Format::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  DedalusSDK::Chat::ChatCompletionContentPartInputAudioParam::InputAudio::Format::TaggedSymbol
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
end
