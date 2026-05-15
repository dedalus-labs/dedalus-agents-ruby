# typed: strong

module DedalusSDK
  module Resources
    class Chat
      sig { returns(DedalusSDK::Resources::Chat::Completions) }
      attr_reader :completions

      # @api private
      sig { params(client: DedalusSDK::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
