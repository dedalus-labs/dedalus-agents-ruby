# typed: strong

module DedalusSDK
  module Models
    MCPCredentials =
      T.let(
        DedalusSDK::Internal::Type::ArrayOf[DedalusSDK::Credential],
        DedalusSDK::Internal::Type::Converter
      )
  end
end
