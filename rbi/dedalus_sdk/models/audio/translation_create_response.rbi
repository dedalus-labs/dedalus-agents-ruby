# typed: strong

module DedalusSDK
  module Models
    module Audio
      # Fields: # noqa: D415.
      #
      # - language (required): str
      # - duration (required): float
      # - text (required): str
      # - segments (optional): list[TranscriptionSegment]
      module TranslationCreateResponse
        extend DedalusSDK::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              DedalusSDK::Models::Audio::TranslationCreateResponse::CreateTranslationResponseVerboseJSON,
              DedalusSDK::Models::Audio::TranslationCreateResponse::CreateTranslationResponseJSON
            )
          end

        class CreateTranslationResponseVerboseJSON < DedalusSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DedalusSDK::Models::Audio::TranslationCreateResponse::CreateTranslationResponseVerboseJSON,
                DedalusSDK::Internal::AnyHash
              )
            end

          # The duration of the input audio.
          sig { returns(Float) }
          attr_accessor :duration

          # The language of the output translation (always `english`).
          sig { returns(String) }
          attr_accessor :language

          # The translated text.
          sig { returns(String) }
          attr_accessor :text

          # Segments of the translated text and their corresponding details.
          sig do
            returns(
              T.nilable(
                T::Array[
                  DedalusSDK::Models::Audio::TranslationCreateResponse::CreateTranslationResponseVerboseJSON::Segment
                ]
              )
            )
          end
          attr_reader :segments

          sig do
            params(
              segments:
                T::Array[
                  DedalusSDK::Models::Audio::TranslationCreateResponse::CreateTranslationResponseVerboseJSON::Segment::OrHash
                ]
            ).void
          end
          attr_writer :segments

          # Fields: # noqa: D415.
          #
          # - language (required): str
          # - duration (required): float
          # - text (required): str
          # - segments (optional): list[TranscriptionSegment]
          sig do
            params(
              duration: Float,
              language: String,
              text: String,
              segments:
                T::Array[
                  DedalusSDK::Models::Audio::TranslationCreateResponse::CreateTranslationResponseVerboseJSON::Segment::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # The duration of the input audio.
            duration:,
            # The language of the output translation (always `english`).
            language:,
            # The translated text.
            text:,
            # Segments of the translated text and their corresponding details.
            segments: nil
          )
          end

          sig do
            override.returns(
              {
                duration: Float,
                language: String,
                text: String,
                segments:
                  T::Array[
                    DedalusSDK::Models::Audio::TranslationCreateResponse::CreateTranslationResponseVerboseJSON::Segment
                  ]
              }
            )
          end
          def to_hash
          end

          class Segment < DedalusSDK::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DedalusSDK::Models::Audio::TranslationCreateResponse::CreateTranslationResponseVerboseJSON::Segment,
                  DedalusSDK::Internal::AnyHash
                )
              end

            # Unique identifier of the segment.
            sig { returns(Integer) }
            attr_accessor :id

            # Average logprob of the segment. If the value is lower than -1, consider the
            # logprobs failed.
            sig { returns(Float) }
            attr_accessor :avg_logprob

            # Compression ratio of the segment. If the value is greater than 2.4, consider the
            # compression failed.
            sig { returns(Float) }
            attr_accessor :compression_ratio

            # End time of the segment in seconds.
            sig { returns(Float) }
            attr_accessor :end_

            # Probability of no speech in the segment. If the value is higher than 1.0 and the
            # `avg_logprob` is below -1, consider this segment silent.
            sig { returns(Float) }
            attr_accessor :no_speech_prob

            # Seek offset of the segment.
            sig { returns(Integer) }
            attr_accessor :seek

            # Start time of the segment in seconds.
            sig { returns(Float) }
            attr_accessor :start

            # Temperature parameter used for generating the segment.
            sig { returns(Float) }
            attr_accessor :temperature

            # Text content of the segment.
            sig { returns(String) }
            attr_accessor :text

            # Array of token IDs for the text content.
            sig { returns(T::Array[Integer]) }
            attr_accessor :tokens

            # Fields: # noqa: D415.
            #
            # - id (required): int
            # - seek (required): int
            # - start (required): float
            # - end (required): float
            # - text (required): str
            # - tokens (required): list[int]
            # - temperature (required): float
            # - avg_logprob (required): float
            # - compression_ratio (required): float
            # - no_speech_prob (required): float
            sig do
              params(
                id: Integer,
                avg_logprob: Float,
                compression_ratio: Float,
                end_: Float,
                no_speech_prob: Float,
                seek: Integer,
                start: Float,
                temperature: Float,
                text: String,
                tokens: T::Array[Integer]
              ).returns(T.attached_class)
            end
            def self.new(
              # Unique identifier of the segment.
              id:,
              # Average logprob of the segment. If the value is lower than -1, consider the
              # logprobs failed.
              avg_logprob:,
              # Compression ratio of the segment. If the value is greater than 2.4, consider the
              # compression failed.
              compression_ratio:,
              # End time of the segment in seconds.
              end_:,
              # Probability of no speech in the segment. If the value is higher than 1.0 and the
              # `avg_logprob` is below -1, consider this segment silent.
              no_speech_prob:,
              # Seek offset of the segment.
              seek:,
              # Start time of the segment in seconds.
              start:,
              # Temperature parameter used for generating the segment.
              temperature:,
              # Text content of the segment.
              text:,
              # Array of token IDs for the text content.
              tokens:
            )
            end

            sig do
              override.returns(
                {
                  id: Integer,
                  avg_logprob: Float,
                  compression_ratio: Float,
                  end_: Float,
                  no_speech_prob: Float,
                  seek: Integer,
                  start: Float,
                  temperature: Float,
                  text: String,
                  tokens: T::Array[Integer]
                }
              )
            end
            def to_hash
            end
          end
        end

        class CreateTranslationResponseJSON < DedalusSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DedalusSDK::Models::Audio::TranslationCreateResponse::CreateTranslationResponseJSON,
                DedalusSDK::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :text

          # Fields: # noqa: D415.
          #
          # - text (required): str
          sig { params(text: String).returns(T.attached_class) }
          def self.new(text:)
          end

          sig { override.returns({ text: String }) }
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[
              DedalusSDK::Models::Audio::TranslationCreateResponse::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
