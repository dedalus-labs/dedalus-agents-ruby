# typed: strong

module DedalusSDK
  module Models
    ChatCompletionTokenLogprob = Chat::ChatCompletionTokenLogprob

    module Chat
      class ChatCompletionTokenLogprob < DedalusSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::Chat::ChatCompletionTokenLogprob,
              DedalusSDK::Internal::AnyHash
            )
          end

        # The token.
        sig { returns(String) }
        attr_accessor :token

        # A list of integers representing the UTF-8 bytes representation of the token.
        # Useful in instances where characters are represented by multiple tokens and
        # their byte representations must be combined to generate the correct text
        # representation. Can be `null` if there is no bytes representation for the token.
        sig { returns(T.nilable(T::Array[Integer])) }
        attr_accessor :bytes

        # The log probability of this token, if it is within the top 20 most likely
        # tokens. Otherwise, the value `-9999.0` is used to signify that the token is very
        # unlikely.
        sig { returns(Float) }
        attr_accessor :logprob

        # List of the most likely tokens and their log probability, at this token
        # position. In rare cases, there may be fewer than the number of requested
        # `top_logprobs` returned.
        sig do
          returns(
            T::Array[DedalusSDK::Chat::ChatCompletionTokenLogprob::TopLogprob]
          )
        end
        attr_accessor :top_logprobs

        # Token log probability information.
        sig do
          params(
            token: String,
            bytes: T.nilable(T::Array[Integer]),
            logprob: Float,
            top_logprobs:
              T::Array[
                DedalusSDK::Chat::ChatCompletionTokenLogprob::TopLogprob::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # The token.
          token:,
          # A list of integers representing the UTF-8 bytes representation of the token.
          # Useful in instances where characters are represented by multiple tokens and
          # their byte representations must be combined to generate the correct text
          # representation. Can be `null` if there is no bytes representation for the token.
          bytes:,
          # The log probability of this token, if it is within the top 20 most likely
          # tokens. Otherwise, the value `-9999.0` is used to signify that the token is very
          # unlikely.
          logprob:,
          # List of the most likely tokens and their log probability, at this token
          # position. In rare cases, there may be fewer than the number of requested
          # `top_logprobs` returned.
          top_logprobs:
        )
        end

        sig do
          override.returns(
            {
              token: String,
              bytes: T.nilable(T::Array[Integer]),
              logprob: Float,
              top_logprobs:
                T::Array[
                  DedalusSDK::Chat::ChatCompletionTokenLogprob::TopLogprob
                ]
            }
          )
        end
        def to_hash
        end

        class TopLogprob < DedalusSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DedalusSDK::Chat::ChatCompletionTokenLogprob::TopLogprob,
                DedalusSDK::Internal::AnyHash
              )
            end

          # The token.
          sig { returns(String) }
          attr_accessor :token

          # A list of integers representing the UTF-8 bytes representation of the token.
          # Useful in instances where characters are represented by multiple tokens and
          # their byte representations must be combined to generate the correct text
          # representation. Can be `null` if there is no bytes representation for the token.
          sig { returns(T.nilable(T::Array[Integer])) }
          attr_accessor :bytes

          # The log probability of this token, if it is within the top 20 most likely
          # tokens. Otherwise, the value `-9999.0` is used to signify that the token is very
          # unlikely.
          sig { returns(Float) }
          attr_accessor :logprob

          # Token and its log probability.
          sig do
            params(
              token: String,
              bytes: T.nilable(T::Array[Integer]),
              logprob: Float
            ).returns(T.attached_class)
          end
          def self.new(
            # The token.
            token:,
            # A list of integers representing the UTF-8 bytes representation of the token.
            # Useful in instances where characters are represented by multiple tokens and
            # their byte representations must be combined to generate the correct text
            # representation. Can be `null` if there is no bytes representation for the token.
            bytes:,
            # The log probability of this token, if it is within the top 20 most likely
            # tokens. Otherwise, the value `-9999.0` is used to signify that the token is very
            # unlikely.
            logprob:
          )
          end

          sig do
            override.returns(
              {
                token: String,
                bytes: T.nilable(T::Array[Integer]),
                logprob: Float
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
