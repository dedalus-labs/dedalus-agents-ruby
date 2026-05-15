# typed: strong

module DedalusSDK
  module Models
    class VoiceIDsOrCustomVoice < DedalusSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            DedalusSDK::VoiceIDsOrCustomVoice,
            DedalusSDK::Internal::AnyHash
          )
        end

      # The custom voice ID, e.g. `voice_1234`.
      sig { returns(String) }
      attr_accessor :id

      # Custom voice reference.
      #
      # Fields:
      #
      # - id (required): str
      sig { params(id: String).returns(T.attached_class) }
      def self.new(
        # The custom voice ID, e.g. `voice_1234`.
        id:
      )
      end

      sig { override.returns({ id: String }) }
      def to_hash
      end
    end
  end
end
