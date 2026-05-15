# typed: strong

module DedalusSDK
  module Models
    # Dedalus model choice - either a string ID or DedalusModel configuration object.
    module DedalusModelChoice
      extend DedalusSDK::Internal::Type::Union

      Variants = T.type_alias { T.any(String, DedalusSDK::DedalusModel) }

      sig do
        override.returns(T::Array[DedalusSDK::DedalusModelChoice::Variants])
      end
      def self.variants
      end
    end
  end
end
