# typed: strong

module DedalusSDK
  module Models
    module JSONValueInput
      extend DedalusSDK::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            String,
            Float,
            T::Boolean,
            T::Hash[Symbol, T.nilable(DedalusSDK::JSONValueInput)],
            T::Array[T.nilable(DedalusSDK::JSONValueInput)]
          )
        end

      sig { override.returns(T::Array[DedalusSDK::JSONValueInput::Variants]) }
      def self.variants
      end

      JSONValueInputMap =
        T.let(
          DedalusSDK::Internal::Type::HashOf[
            union: DedalusSDK::JSONValueInput,
            nil?: true
          ],
          DedalusSDK::Internal::Type::Converter
        )

      JSONValueInputArray =
        T.let(
          DedalusSDK::Internal::Type::ArrayOf[
            union: DedalusSDK::JSONValueInput,
            nil?: true
          ],
          DedalusSDK::Internal::Type::Converter
        )
    end
  end
end
