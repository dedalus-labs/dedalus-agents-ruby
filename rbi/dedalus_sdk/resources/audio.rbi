# typed: strong

module DedalusSDK
  module Resources
    class Audio
      sig { returns(DedalusSDK::Resources::Audio::Speech) }
      attr_reader :speech

      sig { returns(DedalusSDK::Resources::Audio::Transcriptions) }
      attr_reader :transcriptions

      sig { returns(DedalusSDK::Resources::Audio::Translations) }
      attr_reader :translations

      # @api private
      sig { params(client: DedalusSDK::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
