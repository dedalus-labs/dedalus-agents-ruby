# frozen_string_literal: true

module DedalusSDK
  module Models
    module Audio
      # Represents a verbose json transcription response returned by model, based on the
      # provided input.
      #
      # Fields:
      #
      # - language (required): str
      # - duration (required): float
      # - text (required): str
      # - words (optional): list[TranscriptionWord]
      # - segments (optional): list[TranscriptionSegment]
      # - usage (optional): TranscriptTextUsageDuration
      #
      # @see DedalusSDK::Resources::Audio::Transcriptions#create
      module TranscriptionCreateResponse
        extend DedalusSDK::Internal::Type::Union

        # Represents a verbose json transcription response returned by model, based on the provided input.
        #
        # Fields:
        #   - language (required): str
        #   - duration (required): float
        #   - text (required): str
        #   - words (optional): list[TranscriptionWord]
        #   - segments (optional): list[TranscriptionSegment]
        #   - usage (optional): TranscriptTextUsageDuration
        variant -> { DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON }

        # Represents a transcription response returned by model, based on the provided input.
        #
        # Fields:
        #   - text (required): str
        #   - logprobs (optional): list[LogprobsItem]
        #   - usage (optional): Usage
        variant -> { DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON }

        class CreateTranscriptionResponseVerboseJSON < DedalusSDK::Internal::Type::BaseModel
          # @!attribute duration
          #   The duration of the input audio.
          #
          #   @return [Float]
          required :duration, Float

          # @!attribute language
          #   The language of the input audio.
          #
          #   @return [String]
          required :language, String

          # @!attribute text
          #   The transcribed text.
          #
          #   @return [String]
          required :text, String

          # @!attribute segments
          #   Segments of the transcribed text and their corresponding details.
          #
          #   @return [Array<DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON::Segment>, nil]
          optional :segments,
                   -> { DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON::Segment] }

          # @!attribute usage
          #   Usage statistics for models billed by audio input duration.
          #
          #   @return [DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON::Usage, nil]
          optional :usage,
                   -> { DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON::Usage }

          # @!attribute words
          #   Extracted words and their corresponding timestamps.
          #
          #   @return [Array<DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON::Word>, nil]
          optional :words,
                   -> { DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON::Word] }

          # @!method initialize(duration:, language:, text:, segments: nil, usage: nil, words: nil)
          #   Represents a verbose json transcription response returned by model, based on the
          #   provided input.
          #
          #   Fields:
          #
          #   - language (required): str
          #   - duration (required): float
          #   - text (required): str
          #   - words (optional): list[TranscriptionWord]
          #   - segments (optional): list[TranscriptionSegment]
          #   - usage (optional): TranscriptTextUsageDuration
          #
          #   @param duration [Float] The duration of the input audio.
          #
          #   @param language [String] The language of the input audio.
          #
          #   @param text [String] The transcribed text.
          #
          #   @param segments [Array<DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON::Segment>] Segments of the transcribed text and their corresponding details.
          #
          #   @param usage [DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON::Usage] Usage statistics for models billed by audio input duration.
          #
          #   @param words [Array<DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON::Word>] Extracted words and their corresponding timestamps.

          class Segment < DedalusSDK::Internal::Type::BaseModel
            # @!attribute id
            #   Unique identifier of the segment.
            #
            #   @return [Integer]
            required :id, Integer

            # @!attribute avg_logprob
            #   Average logprob of the segment. If the value is lower than -1, consider the
            #   logprobs failed.
            #
            #   @return [Float]
            required :avg_logprob, Float

            # @!attribute compression_ratio
            #   Compression ratio of the segment. If the value is greater than 2.4, consider the
            #   compression failed.
            #
            #   @return [Float]
            required :compression_ratio, Float

            # @!attribute end_
            #   End time of the segment in seconds.
            #
            #   @return [Float]
            required :end_, Float, api_name: :end

            # @!attribute no_speech_prob
            #   Probability of no speech in the segment. If the value is higher than 1.0 and the
            #   `avg_logprob` is below -1, consider this segment silent.
            #
            #   @return [Float]
            required :no_speech_prob, Float

            # @!attribute seek
            #   Seek offset of the segment.
            #
            #   @return [Integer]
            required :seek, Integer

            # @!attribute start
            #   Start time of the segment in seconds.
            #
            #   @return [Float]
            required :start, Float

            # @!attribute temperature
            #   Temperature parameter used for generating the segment.
            #
            #   @return [Float]
            required :temperature, Float

            # @!attribute text
            #   Text content of the segment.
            #
            #   @return [String]
            required :text, String

            # @!attribute tokens
            #   Array of token IDs for the text content.
            #
            #   @return [Array<Integer>]
            required :tokens, DedalusSDK::Internal::Type::ArrayOf[Integer]

            # @!method initialize(id:, avg_logprob:, compression_ratio:, end_:, no_speech_prob:, seek:, start:, temperature:, text:, tokens:)
            #   Some parameter documentations has been truncated, see
            #   {DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON::Segment}
            #   for more details.
            #
            #   Fields: # noqa: D415.
            #
            #   - id (required): int
            #   - seek (required): int
            #   - start (required): float
            #   - end (required): float
            #   - text (required): str
            #   - tokens (required): list[int]
            #   - temperature (required): float
            #   - avg_logprob (required): float
            #   - compression_ratio (required): float
            #   - no_speech_prob (required): float
            #
            #   @param id [Integer] Unique identifier of the segment.
            #
            #   @param avg_logprob [Float] Average logprob of the segment. If the value is lower than -1, consider the logp
            #
            #   @param compression_ratio [Float] Compression ratio of the segment. If the value is greater than 2.4, consider the
            #
            #   @param end_ [Float] End time of the segment in seconds.
            #
            #   @param no_speech_prob [Float] Probability of no speech in the segment. If the value is higher than 1.0 and the
            #
            #   @param seek [Integer] Seek offset of the segment.
            #
            #   @param start [Float] Start time of the segment in seconds.
            #
            #   @param temperature [Float] Temperature parameter used for generating the segment.
            #
            #   @param text [String] Text content of the segment.
            #
            #   @param tokens [Array<Integer>] Array of token IDs for the text content.
          end

          # @see DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON#usage
          class Usage < DedalusSDK::Internal::Type::BaseModel
            # @!attribute seconds
            #   Duration of the input audio in seconds.
            #
            #   @return [Float]
            required :seconds, Float

            # @!attribute type
            #   The type of the usage object. Always `duration` for this variant.
            #
            #   @return [Symbol, :duration]
            required :type, const: :duration

            # @!method initialize(seconds:, type: :duration)
            #   Usage statistics for models billed by audio input duration.
            #
            #   @param seconds [Float] Duration of the input audio in seconds.
            #
            #   @param type [Symbol, :duration] The type of the usage object. Always `duration` for this variant.
          end

          class Word < DedalusSDK::Internal::Type::BaseModel
            # @!attribute end_
            #   End time of the word in seconds.
            #
            #   @return [Float]
            required :end_, Float, api_name: :end

            # @!attribute start
            #   Start time of the word in seconds.
            #
            #   @return [Float]
            required :start, Float

            # @!attribute word
            #   The text content of the word.
            #
            #   @return [String]
            required :word, String

            # @!method initialize(end_:, start:, word:)
            #   Fields: # noqa: D415.
            #
            #   - word (required): str
            #   - start (required): float
            #   - end (required): float
            #
            #   @param end_ [Float] End time of the word in seconds.
            #
            #   @param start [Float] Start time of the word in seconds.
            #
            #   @param word [String] The text content of the word.
          end
        end

        class CreateTranscriptionResponseJSON < DedalusSDK::Internal::Type::BaseModel
          # @!attribute text
          #   The transcribed text.
          #
          #   @return [String]
          required :text, String

          # @!attribute logprobs
          #   The log probabilities of the tokens in the transcription. Only returned with the
          #   models `gpt-4o-transcribe` and `gpt-4o-mini-transcribe` if `logprobs` is added
          #   to the `include` array.
          #
          #   @return [Array<DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Logprob>, nil]
          optional :logprobs,
                   -> { DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Logprob] }

          # @!attribute usage
          #   Token usage statistics for the request.
          #
          #   @return [DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Usage::Tokens, DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Usage::Duration, nil]
          optional :usage,
                   union: -> { DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Usage }

          # @!method initialize(text:, logprobs: nil, usage: nil)
          #   Some parameter documentations has been truncated, see
          #   {DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON}
          #   for more details.
          #
          #   Represents a transcription response returned by model, based on the provided
          #   input.
          #
          #   Fields:
          #
          #   - text (required): str
          #   - logprobs (optional): list[LogprobsItem]
          #   - usage (optional): Usage
          #
          #   @param text [String] The transcribed text.
          #
          #   @param logprobs [Array<DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Logprob>] The log probabilities of the tokens in the transcription. Only returned with the
          #
          #   @param usage [DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Usage::Tokens, DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Usage::Duration] Token usage statistics for the request.

          class Logprob < DedalusSDK::Internal::Type::BaseModel
            # @!attribute token
            #   The token in the transcription.
            #
            #   @return [String, nil]
            optional :token, String

            # @!attribute bytes
            #   The bytes of the token.
            #
            #   @return [Array<Float>, nil]
            optional :bytes, DedalusSDK::Internal::Type::ArrayOf[Float]

            # @!attribute logprob
            #   The log probability of the token.
            #
            #   @return [Float, nil]
            optional :logprob, Float

            # @!method initialize(token: nil, bytes: nil, logprob: nil)
            #   Fields: # noqa: D415.
            #
            #   - token (optional): str
            #   - logprob (optional): float
            #   - bytes (optional): list[float]
            #
            #   @param token [String] The token in the transcription.
            #
            #   @param bytes [Array<Float>] The bytes of the token.
            #
            #   @param logprob [Float] The log probability of the token.
          end

          # Token usage statistics for the request.
          #
          # @see DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON#usage
          module Usage
            extend DedalusSDK::Internal::Type::Union

            discriminator :type

            # Usage statistics for models billed by token usage.
            #
            # Fields:
            #   - type (required): Literal['tokens']
            #   - input_tokens (required): int
            #   - input_token_details (optional): InputTokenDetails
            #   - output_tokens (required): int
            #   - total_tokens (required): int
            variant :tokens,
                    -> { DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Usage::Tokens }

            # Usage statistics for models billed by audio input duration.
            #
            # Fields:
            #   - type (required): Literal['duration']
            #   - seconds (required): float
            variant :duration,
                    -> { DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Usage::Duration }

            class Tokens < DedalusSDK::Internal::Type::BaseModel
              # @!attribute input_tokens
              #   Number of input tokens billed for this request.
              #
              #   @return [Integer]
              required :input_tokens, Integer

              # @!attribute output_tokens
              #   Number of output tokens generated.
              #
              #   @return [Integer]
              required :output_tokens, Integer

              # @!attribute total_tokens
              #   Total number of tokens used (input + output).
              #
              #   @return [Integer]
              required :total_tokens, Integer

              # @!attribute type
              #   The type of the usage object. Always `tokens` for this variant.
              #
              #   @return [Symbol, :tokens]
              required :type, const: :tokens

              # @!attribute input_token_details
              #   Details about the input tokens billed for this request.
              #
              #   @return [DedalusSDK::Models::Chat::InputTokenDetails, nil]
              optional :input_token_details, -> { DedalusSDK::Chat::InputTokenDetails }

              # @!method initialize(input_tokens:, output_tokens:, total_tokens:, input_token_details: nil, type: :tokens)
              #   Usage statistics for models billed by token usage.
              #
              #   Fields:
              #
              #   - type (required): Literal['tokens']
              #   - input_tokens (required): int
              #   - input_token_details (optional): InputTokenDetails
              #   - output_tokens (required): int
              #   - total_tokens (required): int
              #
              #   @param input_tokens [Integer] Number of input tokens billed for this request.
              #
              #   @param output_tokens [Integer] Number of output tokens generated.
              #
              #   @param total_tokens [Integer] Total number of tokens used (input + output).
              #
              #   @param input_token_details [DedalusSDK::Models::Chat::InputTokenDetails] Details about the input tokens billed for this request.
              #
              #   @param type [Symbol, :tokens] The type of the usage object. Always `tokens` for this variant.
            end

            class Duration < DedalusSDK::Internal::Type::BaseModel
              # @!attribute seconds
              #   Duration of the input audio in seconds.
              #
              #   @return [Float]
              required :seconds, Float

              # @!attribute type
              #   The type of the usage object. Always `duration` for this variant.
              #
              #   @return [Symbol, :duration]
              required :type, const: :duration

              # @!method initialize(seconds:, type: :duration)
              #   Usage statistics for models billed by audio input duration.
              #
              #   Fields:
              #
              #   - type (required): Literal['duration']
              #   - seconds (required): float
              #
              #   @param seconds [Float] Duration of the input audio in seconds.
              #
              #   @param type [Symbol, :duration] The type of the usage object. Always `duration` for this variant.
            end

            # @!method self.variants
            #   @return [Array(DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Usage::Tokens, DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Usage::Duration)]
          end
        end

        # @!method self.variants
        #   @return [Array(DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON, DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON)]
      end
    end
  end
end
