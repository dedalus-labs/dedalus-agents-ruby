# typed: strong

module DedalusSDK
  module Models
    module Chat
      class Audio < DedalusSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(DedalusSDK::Chat::Audio, DedalusSDK::Internal::AnyHash)
          end

        # Unique identifier for a previous audio response from the model.
        sig { returns(String) }
        attr_accessor :id

        # Data about a previous audio response from the model.
        # [Learn more](/docs/guides/audio).
        #
        # Fields:
        #
        # - id (required): str
        sig { params(id: String).returns(T.attached_class) }
        def self.new(
          # Unique identifier for a previous audio response from the model.
          id:
        )
        end

        sig { override.returns({ id: String }) }
        def to_hash
        end
      end
    end
  end
end
