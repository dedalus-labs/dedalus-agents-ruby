# typed: strong

module DedalusSDK
  module Models
    module Chat
      class InputTokenDetails < DedalusSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::Chat::InputTokenDetails,
              DedalusSDK::Internal::AnyHash
            )
          end

        # Number of audio tokens billed for this request.
        sig { returns(T.nilable(Integer)) }
        attr_reader :audio_tokens

        sig { params(audio_tokens: Integer).void }
        attr_writer :audio_tokens

        # Number of text tokens billed for this request.
        sig { returns(T.nilable(Integer)) }
        attr_reader :text_tokens

        sig { params(text_tokens: Integer).void }
        attr_writer :text_tokens

        # Details about the input tokens billed for this request.
        #
        # Fields:
        #
        # - text_tokens (optional): int
        # - audio_tokens (optional): int
        sig do
          params(audio_tokens: Integer, text_tokens: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # Number of audio tokens billed for this request.
          audio_tokens: nil,
          # Number of text tokens billed for this request.
          text_tokens: nil
        )
        end

        sig do
          override.returns({ audio_tokens: Integer, text_tokens: Integer })
        end
        def to_hash
        end
      end
    end
  end
end
