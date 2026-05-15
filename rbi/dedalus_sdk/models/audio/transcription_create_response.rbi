# typed: strong

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
      module TranscriptionCreateResponse
        extend DedalusSDK::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON,
              DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON
            )
          end

        class CreateTranscriptionResponseVerboseJSON < DedalusSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON,
                DedalusSDK::Internal::AnyHash
              )
            end

          # The duration of the input audio.
          sig { returns(Float) }
          attr_accessor :duration

          # The language of the input audio.
          sig { returns(String) }
          attr_accessor :language

          # The transcribed text.
          sig { returns(String) }
          attr_accessor :text

          # Segments of the transcribed text and their corresponding details.
          sig do
            returns(
              T.nilable(
                T::Array[
                  DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON::Segment
                ]
              )
            )
          end
          attr_reader :segments

          sig do
            params(
              segments:
                T::Array[
                  DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON::Segment::OrHash
                ]
            ).void
          end
          attr_writer :segments

          # Usage statistics for models billed by audio input duration.
          sig do
            returns(
              T.nilable(
                DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON::Usage
              )
            )
          end
          attr_reader :usage

          sig do
            params(
              usage:
                DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON::Usage::OrHash
            ).void
          end
          attr_writer :usage

          # Extracted words and their corresponding timestamps.
          sig do
            returns(
              T.nilable(
                T::Array[
                  DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON::Word
                ]
              )
            )
          end
          attr_reader :words

          sig do
            params(
              words:
                T::Array[
                  DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON::Word::OrHash
                ]
            ).void
          end
          attr_writer :words

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
          sig do
            params(
              duration: Float,
              language: String,
              text: String,
              segments:
                T::Array[
                  DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON::Segment::OrHash
                ],
              usage:
                DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON::Usage::OrHash,
              words:
                T::Array[
                  DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON::Word::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # The duration of the input audio.
            duration:,
            # The language of the input audio.
            language:,
            # The transcribed text.
            text:,
            # Segments of the transcribed text and their corresponding details.
            segments: nil,
            # Usage statistics for models billed by audio input duration.
            usage: nil,
            # Extracted words and their corresponding timestamps.
            words: nil
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
                    DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON::Segment
                  ],
                usage:
                  DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON::Usage,
                words:
                  T::Array[
                    DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON::Word
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
                  DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON::Segment,
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

          class Usage < DedalusSDK::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON::Usage,
                  DedalusSDK::Internal::AnyHash
                )
              end

            # Duration of the input audio in seconds.
            sig { returns(Float) }
            attr_accessor :seconds

            # The type of the usage object. Always `duration` for this variant.
            sig { returns(Symbol) }
            attr_accessor :type

            # Usage statistics for models billed by audio input duration.
            sig do
              params(seconds: Float, type: Symbol).returns(T.attached_class)
            end
            def self.new(
              # Duration of the input audio in seconds.
              seconds:,
              # The type of the usage object. Always `duration` for this variant.
              type: :duration
            )
            end

            sig { override.returns({ seconds: Float, type: Symbol }) }
            def to_hash
            end
          end

          class Word < DedalusSDK::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseVerboseJSON::Word,
                  DedalusSDK::Internal::AnyHash
                )
              end

            # End time of the word in seconds.
            sig { returns(Float) }
            attr_accessor :end_

            # Start time of the word in seconds.
            sig { returns(Float) }
            attr_accessor :start

            # The text content of the word.
            sig { returns(String) }
            attr_accessor :word

            # Fields: # noqa: D415.
            #
            # - word (required): str
            # - start (required): float
            # - end (required): float
            sig do
              params(end_: Float, start: Float, word: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # End time of the word in seconds.
              end_:,
              # Start time of the word in seconds.
              start:,
              # The text content of the word.
              word:
            )
            end

            sig do
              override.returns({ end_: Float, start: Float, word: String })
            end
            def to_hash
            end
          end
        end

        class CreateTranscriptionResponseJSON < DedalusSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON,
                DedalusSDK::Internal::AnyHash
              )
            end

          # The transcribed text.
          sig { returns(String) }
          attr_accessor :text

          # The log probabilities of the tokens in the transcription. Only returned with the
          # models `gpt-4o-transcribe` and `gpt-4o-mini-transcribe` if `logprobs` is added
          # to the `include` array.
          sig do
            returns(
              T.nilable(
                T::Array[
                  DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Logprob
                ]
              )
            )
          end
          attr_reader :logprobs

          sig do
            params(
              logprobs:
                T::Array[
                  DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Logprob::OrHash
                ]
            ).void
          end
          attr_writer :logprobs

          # Token usage statistics for the request.
          sig do
            returns(
              T.nilable(
                DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Usage::Variants
              )
            )
          end
          attr_reader :usage

          sig do
            params(
              usage:
                T.any(
                  DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Usage::Tokens::OrHash,
                  DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Usage::Duration::OrHash
                )
            ).void
          end
          attr_writer :usage

          # Represents a transcription response returned by model, based on the provided
          # input.
          #
          # Fields:
          #
          # - text (required): str
          # - logprobs (optional): list[LogprobsItem]
          # - usage (optional): Usage
          sig do
            params(
              text: String,
              logprobs:
                T::Array[
                  DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Logprob::OrHash
                ],
              usage:
                T.any(
                  DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Usage::Tokens::OrHash,
                  DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Usage::Duration::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # The transcribed text.
            text:,
            # The log probabilities of the tokens in the transcription. Only returned with the
            # models `gpt-4o-transcribe` and `gpt-4o-mini-transcribe` if `logprobs` is added
            # to the `include` array.
            logprobs: nil,
            # Token usage statistics for the request.
            usage: nil
          )
          end

          sig do
            override.returns(
              {
                text: String,
                logprobs:
                  T::Array[
                    DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Logprob
                  ],
                usage:
                  DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Usage::Variants
              }
            )
          end
          def to_hash
          end

          class Logprob < DedalusSDK::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Logprob,
                  DedalusSDK::Internal::AnyHash
                )
              end

            # The token in the transcription.
            sig { returns(T.nilable(String)) }
            attr_reader :token

            sig { params(token: String).void }
            attr_writer :token

            # The bytes of the token.
            sig { returns(T.nilable(T::Array[Float])) }
            attr_reader :bytes

            sig { params(bytes: T::Array[Float]).void }
            attr_writer :bytes

            # The log probability of the token.
            sig { returns(T.nilable(Float)) }
            attr_reader :logprob

            sig { params(logprob: Float).void }
            attr_writer :logprob

            # Fields: # noqa: D415.
            #
            # - token (optional): str
            # - logprob (optional): float
            # - bytes (optional): list[float]
            sig do
              params(
                token: String,
                bytes: T::Array[Float],
                logprob: Float
              ).returns(T.attached_class)
            end
            def self.new(
              # The token in the transcription.
              token: nil,
              # The bytes of the token.
              bytes: nil,
              # The log probability of the token.
              logprob: nil
            )
            end

            sig do
              override.returns(
                { token: String, bytes: T::Array[Float], logprob: Float }
              )
            end
            def to_hash
            end
          end

          # Token usage statistics for the request.
          module Usage
            extend DedalusSDK::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Usage::Tokens,
                  DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Usage::Duration
                )
              end

            class Tokens < DedalusSDK::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Usage::Tokens,
                    DedalusSDK::Internal::AnyHash
                  )
                end

              # Number of input tokens billed for this request.
              sig { returns(Integer) }
              attr_accessor :input_tokens

              # Number of output tokens generated.
              sig { returns(Integer) }
              attr_accessor :output_tokens

              # Total number of tokens used (input + output).
              sig { returns(Integer) }
              attr_accessor :total_tokens

              # The type of the usage object. Always `tokens` for this variant.
              sig { returns(Symbol) }
              attr_accessor :type

              # Details about the input tokens billed for this request.
              sig { returns(T.nilable(DedalusSDK::Chat::InputTokenDetails)) }
              attr_reader :input_token_details

              sig do
                params(
                  input_token_details:
                    DedalusSDK::Chat::InputTokenDetails::OrHash
                ).void
              end
              attr_writer :input_token_details

              # Usage statistics for models billed by token usage.
              #
              # Fields:
              #
              # - type (required): Literal['tokens']
              # - input_tokens (required): int
              # - input_token_details (optional): InputTokenDetails
              # - output_tokens (required): int
              # - total_tokens (required): int
              sig do
                params(
                  input_tokens: Integer,
                  output_tokens: Integer,
                  total_tokens: Integer,
                  input_token_details:
                    DedalusSDK::Chat::InputTokenDetails::OrHash,
                  type: Symbol
                ).returns(T.attached_class)
              end
              def self.new(
                # Number of input tokens billed for this request.
                input_tokens:,
                # Number of output tokens generated.
                output_tokens:,
                # Total number of tokens used (input + output).
                total_tokens:,
                # Details about the input tokens billed for this request.
                input_token_details: nil,
                # The type of the usage object. Always `tokens` for this variant.
                type: :tokens
              )
              end

              sig do
                override.returns(
                  {
                    input_tokens: Integer,
                    output_tokens: Integer,
                    total_tokens: Integer,
                    type: Symbol,
                    input_token_details: DedalusSDK::Chat::InputTokenDetails
                  }
                )
              end
              def to_hash
              end
            end

            class Duration < DedalusSDK::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Usage::Duration,
                    DedalusSDK::Internal::AnyHash
                  )
                end

              # Duration of the input audio in seconds.
              sig { returns(Float) }
              attr_accessor :seconds

              # The type of the usage object. Always `duration` for this variant.
              sig { returns(Symbol) }
              attr_accessor :type

              # Usage statistics for models billed by audio input duration.
              #
              # Fields:
              #
              # - type (required): Literal['duration']
              # - seconds (required): float
              sig do
                params(seconds: Float, type: Symbol).returns(T.attached_class)
              end
              def self.new(
                # Duration of the input audio in seconds.
                seconds:,
                # The type of the usage object. Always `duration` for this variant.
                type: :duration
              )
              end

              sig { override.returns({ seconds: Float, type: Symbol }) }
              def to_hash
              end
            end

            sig do
              override.returns(
                T::Array[
                  DedalusSDK::Models::Audio::TranscriptionCreateResponse::CreateTranscriptionResponseJSON::Usage::Variants
                ]
              )
            end
            def self.variants
            end
          end
        end

        sig do
          override.returns(
            T::Array[
              DedalusSDK::Models::Audio::TranscriptionCreateResponse::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
