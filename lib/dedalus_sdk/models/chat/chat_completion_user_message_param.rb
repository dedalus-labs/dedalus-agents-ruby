# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      class ChatCompletionUserMessageParam < DedalusSDK::Internal::Type::BaseModel
        # @!attribute content
        #   The contents of the user message.
        #
        #   @return [String, Array<DedalusSDK::Models::Chat::ChatCompletionContentPartTextParam, DedalusSDK::Models::Chat::ChatCompletionContentPartImageParam, DedalusSDK::Models::Chat::ChatCompletionContentPartInputAudioParam, DedalusSDK::Models::Chat::ChatCompletionContentPartFileParam>]
        required :content, union: -> { DedalusSDK::Chat::ChatCompletionUserMessageParam::Content }

        # @!attribute role
        #   The role of the messages author, in this case `user`.
        #
        #   @return [Symbol, :user]
        required :role, const: :user

        # @!attribute name
        #   An optional name for the participant. Provides the model information to
        #   differentiate between participants of the same role.
        #
        #   @return [String, nil]
        optional :name, String

        # @!method initialize(content:, name: nil, role: :user)
        #   Some parameter documentations has been truncated, see
        #   {DedalusSDK::Models::Chat::ChatCompletionUserMessageParam} for more details.
        #
        #   Messages sent by an end user, containing prompts or additional context
        #   information.
        #
        #   Fields:
        #
        #   - content (required): str |
        #     Annotated[list[ChatCompletionRequestUserMessageContentPart], MinLen(1),
        #     ArrayTitle("ChatCompletionRequestUserMessageContentArray")]
        #   - role (required): Literal["user"]
        #   - name (optional): str
        #
        #   @param content [String, Array<DedalusSDK::Models::Chat::ChatCompletionContentPartTextParam, DedalusSDK::Models::Chat::ChatCompletionContentPartImageParam, DedalusSDK::Models::Chat::ChatCompletionContentPartInputAudioParam, DedalusSDK::Models::Chat::ChatCompletionContentPartFileParam>] The contents of the user message.
        #
        #   @param name [String] An optional name for the participant. Provides the model information to differen
        #
        #   @param role [Symbol, :user] The role of the messages author, in this case `user`.

        # The contents of the user message.
        #
        # @see DedalusSDK::Models::Chat::ChatCompletionUserMessageParam#content
        module Content
          extend DedalusSDK::Internal::Type::Union

          variant String

          variant -> { DedalusSDK::Models::Chat::ChatCompletionUserMessageParam::Content::ChatCompletionRequestUserMessageContent2DArray }

          # Learn about [text inputs](/docs/guides/text-generation).
          #
          # Fields:
          #
          # - type (required): Literal["text"]
          # - text (required): str
          module ChatCompletionRequestUserMessageContentArray
            extend DedalusSDK::Internal::Type::Union

            discriminator :type

            # Learn about [text inputs](/docs/guides/text-generation).
            #
            # Fields:
            # - type (required): Literal["text"]
            # - text (required): str
            variant :text, -> { DedalusSDK::Chat::ChatCompletionContentPartTextParam }

            # Learn about [image inputs](/docs/guides/vision).
            #
            # Fields:
            # - type (required): Literal["image_url"]
            # - image_url (required): ImageUrl
            variant :image_url, -> { DedalusSDK::Chat::ChatCompletionContentPartImageParam }

            # Learn about [audio inputs](/docs/guides/audio).
            #
            # Fields:
            # - type (required): Literal["input_audio"]
            # - input_audio (required): InputAudio
            variant :input_audio, -> { DedalusSDK::Chat::ChatCompletionContentPartInputAudioParam }

            # Learn about [file inputs](/docs/guides/text) for text generation.
            #
            # Fields:
            # - type (required): Literal["file"]
            # - file (required): File
            variant :file, -> { DedalusSDK::Chat::ChatCompletionContentPartFileParam }

            # @!method self.variants
            #   @return [Array(DedalusSDK::Models::Chat::ChatCompletionContentPartTextParam, DedalusSDK::Models::Chat::ChatCompletionContentPartImageParam, DedalusSDK::Models::Chat::ChatCompletionContentPartInputAudioParam, DedalusSDK::Models::Chat::ChatCompletionContentPartFileParam)]
          end

          # @!method self.variants
          #   @return [Array(String, Array<DedalusSDK::Models::Chat::ChatCompletionContentPartTextParam, DedalusSDK::Models::Chat::ChatCompletionContentPartImageParam, DedalusSDK::Models::Chat::ChatCompletionContentPartInputAudioParam, DedalusSDK::Models::Chat::ChatCompletionContentPartFileParam>)]

          # @type [DedalusSDK::Internal::Type::Converter]
          ChatCompletionRequestUserMessageContent2DArray =
            DedalusSDK::Internal::Type::ArrayOf[
              union: -> { DedalusSDK::Chat::ChatCompletionUserMessageParam::Content::ChatCompletionRequestUserMessageContentArray }
            ]
        end
      end
    end

    ChatCompletionUserMessageParam = Chat::ChatCompletionUserMessageParam
  end
end
