# frozen_string_literal: true

module DedalusSDK
  module Resources
    class Audio
      class Speech
        # Some parameter documentations has been truncated, see
        # {DedalusSDK::Models::Audio::SpeechCreateParams} for more details.
        #
        # Generate speech audio from text.
        #
        # Generates audio from the input text using text-to-speech models. Supports
        # multiple voices and output formats including mp3, opus, aac, flac, wav, and pcm.
        #
        # Returns streaming audio data that can be saved to a file or streamed directly to
        # users.
        #
        # @overload create(input:, model:, voice:, instructions: nil, response_format: nil, speed: nil, stream_format: nil, request_options: {})
        #
        # @param input [String] The text to generate audio for. The maximum length is 4096 characters.
        #
        # @param model [String, Symbol, DedalusSDK::Models::Audio::SpeechCreateParams::Model] One of the available [TTS models](/docs/models#tts): `tts-1`, `tts-1-hd`, `gpt-4
        #
        # @param voice [String, Symbol, DedalusSDK::Models::VoiceIDsOrCustomVoice, DedalusSDK::Models::Audio::SpeechCreateParams::Voice] The voice to use when generating the audio. Supported built-in voices are `alloy
        #
        # @param instructions [String] Control the voice of your generated audio with additional instructions. Does not
        #
        # @param response_format [Symbol, DedalusSDK::Models::Audio::SpeechCreateParams::ResponseFormat] The format to audio in. Supported formats are `mp3`, `opus`, `aac`, `flac`, `wav
        #
        # @param speed [Float] The speed of the generated audio. Select a value from `0.25` to `4.0`. `1.0` is
        #
        # @param stream_format [Symbol, DedalusSDK::Models::Audio::SpeechCreateParams::StreamFormat] The format to stream the audio in. Supported formats are `sse` and `audio`. `sse
        #
        # @param request_options [DedalusSDK::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [StringIO]
        #
        # @see DedalusSDK::Models::Audio::SpeechCreateParams
        def create(params)
          parsed, options = DedalusSDK::Audio::SpeechCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "v1/audio/speech",
            headers: {"accept" => "audio/mpeg"},
            body: parsed,
            model: StringIO,
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
