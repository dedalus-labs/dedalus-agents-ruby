# typed: strong

module DedalusSDK
  module Models
    JSONObjectInput =
      T.let(
        DedalusSDK::Internal::Type::HashOf[
          union: DedalusSDK::JSONValueInput,
          nil?: true
        ],
        DedalusSDK::Internal::Type::Converter
      )
  end
end
