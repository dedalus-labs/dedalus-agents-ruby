# frozen_string_literal: true

module DedalusSDK
  module Models
    # @type [DedalusSDK::Internal::Type::Converter]
    MCPCredentials = DedalusSDK::Internal::Type::ArrayOf[-> { DedalusSDK::Credential }]
  end
end
