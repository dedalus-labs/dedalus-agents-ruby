# frozen_string_literal: true

module DedalusSDK
  module Resources
    class Chat
      # @return [DedalusSDK::Resources::Chat::Completions]
      attr_reader :completions

      # @api private
      #
      # @param client [DedalusSDK::Client]
      def initialize(client:)
        @client = client
        @completions = DedalusSDK::Resources::Chat::Completions.new(client: client)
      end
    end
  end
end
