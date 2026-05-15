# typed: strong

module DedalusSDK
  module Models
    module Chat
      class PromptTokensDetails < DedalusSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::Chat::PromptTokensDetails,
              DedalusSDK::Internal::AnyHash
            )
          end

        # Audio input tokens present in the prompt.
        sig { returns(T.nilable(Integer)) }
        attr_reader :audio_tokens

        sig { params(audio_tokens: Integer).void }
        attr_writer :audio_tokens

        # Cached tokens present in the prompt.
        sig { returns(T.nilable(Integer)) }
        attr_reader :cached_tokens

        sig { params(cached_tokens: Integer).void }
        attr_writer :cached_tokens

        # Breakdown of tokens used in the prompt.
        #
        # Fields:
        #
        # - audio_tokens (optional): int
        # - cached_tokens (optional): int
        sig do
          params(audio_tokens: Integer, cached_tokens: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # Audio input tokens present in the prompt.
          audio_tokens: nil,
          # Cached tokens present in the prompt.
          cached_tokens: nil
        )
        end

        sig do
          override.returns({ audio_tokens: Integer, cached_tokens: Integer })
        end
        def to_hash
        end
      end
    end
  end
end
