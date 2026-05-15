# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      class ChatCompletionContentPartInputAudioParam < DedalusSDK::Internal::Type::BaseModel
        # @!attribute input_audio
        #   Schema for InputAudio.
        #
        #   Fields:
        #
        #   - data (required): str
        #   - format (required): Literal["wav", "mp3"]
        #
        #   @return [DedalusSDK::Models::Chat::ChatCompletionContentPartInputAudioParam::InputAudio]
        required :input_audio, -> { DedalusSDK::Chat::ChatCompletionContentPartInputAudioParam::InputAudio }

        # @!attribute type
        #   The type of the content part. Always `input_audio`.
        #
        #   @return [Symbol, :input_audio]
        required :type, const: :input_audio

        # @!method initialize(input_audio:, type: :input_audio)
        #   Some parameter documentations has been truncated, see
        #   {DedalusSDK::Models::Chat::ChatCompletionContentPartInputAudioParam} for more
        #   details.
        #
        #   Learn about [audio inputs](/docs/guides/audio).
        #
        #   Fields:
        #
        #   - type (required): Literal["input_audio"]
        #   - input_audio (required): InputAudio
        #
        #   @param input_audio [DedalusSDK::Models::Chat::ChatCompletionContentPartInputAudioParam::InputAudio] Schema for InputAudio.
        #
        #   @param type [Symbol, :input_audio] The type of the content part. Always `input_audio`.

        # @see DedalusSDK::Models::Chat::ChatCompletionContentPartInputAudioParam#input_audio
        class InputAudio < DedalusSDK::Internal::Type::BaseModel
          # @!attribute data
          #   Base64 encoded audio data.
          #
          #   @return [String]
          required :data, String

          # @!attribute format_
          #   The format of the encoded audio data. Currently supports "wav" and "mp3".
          #
          #   @return [Symbol, DedalusSDK::Models::Chat::ChatCompletionContentPartInputAudioParam::InputAudio::Format]
          required :format_,
                   enum: -> {
                     DedalusSDK::Chat::ChatCompletionContentPartInputAudioParam::InputAudio::Format
                   },
                   api_name: :format

          # @!method initialize(data:, format_:)
          #   Schema for InputAudio.
          #
          #   Fields:
          #
          #   - data (required): str
          #   - format (required): Literal["wav", "mp3"]
          #
          #   @param data [String] Base64 encoded audio data.
          #
          #   @param format_ [Symbol, DedalusSDK::Models::Chat::ChatCompletionContentPartInputAudioParam::InputAudio::Format] The format of the encoded audio data. Currently supports "wav" and "mp3".

          # The format of the encoded audio data. Currently supports "wav" and "mp3".
          #
          # @see DedalusSDK::Models::Chat::ChatCompletionContentPartInputAudioParam::InputAudio#format_
          module Format
            extend DedalusSDK::Internal::Type::Enum

            WAV = :wav
            MP3 = :mp3

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end

    ChatCompletionContentPartInputAudioParam = Chat::ChatCompletionContentPartInputAudioParam
  end
end
