# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      class ChatCompletionSystemMessageParam < DedalusSDK::Internal::Type::BaseModel
        # @!attribute content
        #   The contents of the system message.
        #
        #   @return [String, Array<DedalusSDK::Models::Chat::ChatCompletionContentPartTextParam>]
        required :content, union: -> { DedalusSDK::Chat::ChatCompletionSystemMessageParam::Content }

        # @!attribute role
        #   The role of the messages author, in this case `system`.
        #
        #   @return [Symbol, :system]
        required :role, const: :system

        # @!attribute name
        #   An optional name for the participant. Provides the model information to
        #   differentiate between participants of the same role.
        #
        #   @return [String, nil]
        optional :name, String

        # @!method initialize(content:, name: nil, role: :system)
        #   Some parameter documentations has been truncated, see
        #   {DedalusSDK::Models::Chat::ChatCompletionSystemMessageParam} for more details.
        #
        #   Developer-provided instructions that the model should follow, regardless of
        #   messages sent by the user. With o1 models and newer, use `developer` messages
        #   for this purpose instead.
        #
        #   Fields:
        #
        #   - content (required): str |
        #     Annotated[list[ChatCompletionRequestSystemMessageContentPart], MinLen(1),
        #     ArrayTitle("ChatCompletionRequestSystemMessageContentArray")]
        #   - role (required): Literal["system"]
        #   - name (optional): str
        #
        #   @param content [String, Array<DedalusSDK::Models::Chat::ChatCompletionContentPartTextParam>] The contents of the system message.
        #
        #   @param name [String] An optional name for the participant. Provides the model information to differen
        #
        #   @param role [Symbol, :system] The role of the messages author, in this case `system`.

        # The contents of the system message.
        #
        # @see DedalusSDK::Models::Chat::ChatCompletionSystemMessageParam#content
        module Content
          extend DedalusSDK::Internal::Type::Union

          variant String

          variant -> { DedalusSDK::Models::Chat::ChatCompletionSystemMessageParam::Content::ChatCompletionContentPartTextParamArray }

          # @!method self.variants
          #   @return [Array(String, Array<DedalusSDK::Models::Chat::ChatCompletionContentPartTextParam>)]

          # @type [DedalusSDK::Internal::Type::Converter]
          ChatCompletionContentPartTextParamArray =
            DedalusSDK::Internal::Type::ArrayOf[-> { DedalusSDK::Chat::ChatCompletionContentPartTextParam }]
        end
      end
    end

    ChatCompletionSystemMessageParam = Chat::ChatCompletionSystemMessageParam
  end
end
