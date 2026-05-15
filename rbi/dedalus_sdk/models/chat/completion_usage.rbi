# typed: strong

module DedalusSDK
  module Models
    module Chat
      class CompletionUsage < DedalusSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::Chat::CompletionUsage,
              DedalusSDK::Internal::AnyHash
            )
          end

        # Number of tokens in the generated completion.
        sig { returns(Integer) }
        attr_accessor :completion_tokens

        # Number of tokens in the prompt.
        sig { returns(Integer) }
        attr_accessor :prompt_tokens

        # Total number of tokens used in the request (prompt + completion).
        sig { returns(Integer) }
        attr_accessor :total_tokens

        # Breakdown of tokens used in a completion.
        sig { returns(T.nilable(DedalusSDK::Chat::CompletionTokensDetails)) }
        attr_reader :completion_tokens_details

        sig do
          params(
            completion_tokens_details:
              DedalusSDK::Chat::CompletionTokensDetails::OrHash
          ).void
        end
        attr_writer :completion_tokens_details

        # Breakdown of tokens used in the prompt.
        sig { returns(T.nilable(DedalusSDK::Chat::PromptTokensDetails)) }
        attr_reader :prompt_tokens_details

        sig do
          params(
            prompt_tokens_details: DedalusSDK::Chat::PromptTokensDetails::OrHash
          ).void
        end
        attr_writer :prompt_tokens_details

        # Usage statistics for the completion request.
        #
        # Fields:
        #
        # - completion_tokens (required): int
        # - prompt_tokens (required): int
        # - total_tokens (required): int
        # - completion_tokens_details (optional): CompletionTokensDetails
        # - prompt_tokens_details (optional): PromptTokensDetails
        sig do
          params(
            completion_tokens: Integer,
            prompt_tokens: Integer,
            total_tokens: Integer,
            completion_tokens_details:
              DedalusSDK::Chat::CompletionTokensDetails::OrHash,
            prompt_tokens_details: DedalusSDK::Chat::PromptTokensDetails::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Number of tokens in the generated completion.
          completion_tokens:,
          # Number of tokens in the prompt.
          prompt_tokens:,
          # Total number of tokens used in the request (prompt + completion).
          total_tokens:,
          # Breakdown of tokens used in a completion.
          completion_tokens_details: nil,
          # Breakdown of tokens used in the prompt.
          prompt_tokens_details: nil
        )
        end

        sig do
          override.returns(
            {
              completion_tokens: Integer,
              prompt_tokens: Integer,
              total_tokens: Integer,
              completion_tokens_details:
                DedalusSDK::Chat::CompletionTokensDetails,
              prompt_tokens_details: DedalusSDK::Chat::PromptTokensDetails
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
