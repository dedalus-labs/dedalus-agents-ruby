# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      class Audio < DedalusSDK::Internal::Type::BaseModel
        # @!attribute id
        #   Unique identifier for a previous audio response from the model.
        #
        #   @return [String]
        required :id, String

        # @!method initialize(id:)
        #   Data about a previous audio response from the model.
        #   [Learn more](/docs/guides/audio).
        #
        #   Fields:
        #
        #   - id (required): str
        #
        #   @param id [String] Unique identifier for a previous audio response from the model.
      end
    end
  end
end
