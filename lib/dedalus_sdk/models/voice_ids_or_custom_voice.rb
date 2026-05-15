# frozen_string_literal: true

module DedalusSDK
  module Models
    class VoiceIDsOrCustomVoice < DedalusSDK::Internal::Type::BaseModel
      # @!attribute id
      #   The custom voice ID, e.g. `voice_1234`.
      #
      #   @return [String]
      required :id, String

      # @!method initialize(id:)
      #   Custom voice reference.
      #
      #   Fields:
      #
      #   - id (required): str
      #
      #   @param id [String] The custom voice ID, e.g. `voice_1234`.
    end
  end
end
