# frozen_string_literal: true

module DedalusSDK
  module Resources
    class Audio
      # @return [DedalusSDK::Resources::Audio::Speech]
      attr_reader :speech

      # @return [DedalusSDK::Resources::Audio::Transcriptions]
      attr_reader :transcriptions

      # @return [DedalusSDK::Resources::Audio::Translations]
      attr_reader :translations

      # @api private
      #
      # @param client [DedalusSDK::Client]
      def initialize(client:)
        @client = client
        @speech = DedalusSDK::Resources::Audio::Speech.new(client: client)
        @transcriptions = DedalusSDK::Resources::Audio::Transcriptions.new(client: client)
        @translations = DedalusSDK::Resources::Audio::Translations.new(client: client)
      end
    end
  end
end
