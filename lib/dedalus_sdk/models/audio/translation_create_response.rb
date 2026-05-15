# frozen_string_literal: true

module DedalusSDK
  module Models
    module Audio
      # Fields: # noqa: D415.
      #
      # - language (required): str
      # - duration (required): float
      # - text (required): str
      # - segments (optional): list[TranscriptionSegment]
      #
      # @see DedalusSDK::Resources::Audio::Translations#create
      module TranslationCreateResponse
        extend DedalusSDK::Internal::Type::Union

        # Fields:  # noqa: D415.
        #
        # - language (required): str
        # - duration (required): float
        # - text (required): str
        # - segments (optional): list[TranscriptionSegment]
        variant -> { DedalusSDK::Models::Audio::TranslationCreateResponse::CreateTranslationResponseVerboseJSON }

        # Fields:  # noqa: D415.
        #
        # - text (required): str
        variant -> { DedalusSDK::Models::Audio::TranslationCreateResponse::CreateTranslationResponseJSON }

        class CreateTranslationResponseVerboseJSON < DedalusSDK::Internal::Type::BaseModel
          # @!attribute duration
          #   The duration of the input audio.
          #
          #   @return [Float]
          required :duration, Float

          # @!attribute language
          #   The language of the output translation (always `english`).
          #
          #   @return [String]
          required :language, String

          # @!attribute text
          #   The translated text.
          #
          #   @return [String]
          required :text, String

          # @!attribute segments
          #   Segments of the translated text and their corresponding details.
          #
          #   @return [Array<DedalusSDK::Models::Audio::TranslationCreateResponse::CreateTranslationResponseVerboseJSON::Segment>, nil]
          optional :segments,
                   -> { DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Models::Audio::TranslationCreateResponse::CreateTranslationResponseVerboseJSON::Segment] }

          # @!method initialize(duration:, language:, text:, segments: nil)
          #   Fields: # noqa: D415.
          #
          #   - language (required): str
          #   - duration (required): float
          #   - text (required): str
          #   - segments (optional): list[TranscriptionSegment]
          #
          #   @param duration [Float] The duration of the input audio.
          #
          #   @param language [String] The language of the output translation (always `english`).
          #
          #   @param text [String] The translated text.
          #
          #   @param segments [Array<DedalusSDK::Models::Audio::TranslationCreateResponse::CreateTranslationResponseVerboseJSON::Segment>] Segments of the translated text and their corresponding details.

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
            #   {DedalusSDK::Models::Audio::TranslationCreateResponse::CreateTranslationResponseVerboseJSON::Segment}
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
        end

        class CreateTranslationResponseJSON < DedalusSDK::Internal::Type::BaseModel
          # @!attribute text
          #
          #   @return [String]
          required :text, String

          # @!method initialize(text:)
          #   Fields: # noqa: D415.
          #
          #   - text (required): str
          #
          #   @param text [String]
        end

        # @!method self.variants
        #   @return [Array(DedalusSDK::Models::Audio::TranslationCreateResponse::CreateTranslationResponseVerboseJSON, DedalusSDK::Models::Audio::TranslationCreateResponse::CreateTranslationResponseJSON)]
      end
    end
  end
end
