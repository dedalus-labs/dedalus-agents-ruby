# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      class ChatCompletionDeveloperMessageParam < DedalusSDK::Internal::Type::BaseModel
        # @!attribute content
        #   The contents of the developer message.
        #
        #   @return [String, Array<DedalusSDK::Models::Chat::ChatCompletionContentPartTextParam>]
        required :content, union: -> { DedalusSDK::Chat::ChatCompletionDeveloperMessageParam::Content }

        # @!attribute role
        #   The role of the messages author, in this case `developer`.
        #
        #   @return [Symbol, :developer]
        required :role, const: :developer

        # @!attribute name
        #   An optional name for the participant. Provides the model information to
        #   differentiate between participants of the same role.
        #
        #   @return [String, nil]
        optional :name, String

        # @!method initialize(content:, name: nil, role: :developer)
        #   Some parameter documentations has been truncated, see
        #   {DedalusSDK::Models::Chat::ChatCompletionDeveloperMessageParam} for more
        #   details.
        #
        #   Developer-provided instructions that the model should follow, regardless of
        #   messages sent by the user. With o1 models and newer, `developer` messages
        #   replace the previous `system` messages.
        #
        #   Fields:
        #
        #   - content (required): str |
        #     Annotated[list[ChatCompletionRequestMessageContentPartText], MinLen(1),
        #     ArrayTitle("ChatCompletionRequestDeveloperMessageContentArray")]
        #   - role (required): Literal["developer"]
        #   - name (optional): str
        #
        #   @param content [String, Array<DedalusSDK::Models::Chat::ChatCompletionContentPartTextParam>] The contents of the developer message.
        #
        #   @param name [String] An optional name for the participant. Provides the model information to differen
        #
        #   @param role [Symbol, :developer] The role of the messages author, in this case `developer`.

        # The contents of the developer message.
        #
        # @see DedalusSDK::Models::Chat::ChatCompletionDeveloperMessageParam#content
        module Content
          extend DedalusSDK::Internal::Type::Union

          variant String

          variant -> { DedalusSDK::Models::Chat::ChatCompletionDeveloperMessageParam::Content::ChatCompletionContentPartTextParamArray }

          # @!method self.variants
          #   @return [Array(String, Array<DedalusSDK::Models::Chat::ChatCompletionContentPartTextParam>)]

          # @type [DedalusSDK::Internal::Type::Converter]
          ChatCompletionContentPartTextParamArray =
            DedalusSDK::Internal::Type::ArrayOf[-> { DedalusSDK::Chat::ChatCompletionContentPartTextParam }]
        end
      end
    end

    ChatCompletionDeveloperMessageParam = Chat::ChatCompletionDeveloperMessageParam
  end
end
