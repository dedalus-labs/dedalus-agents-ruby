# frozen_string_literal: true

module DedalusSDK
  module Models
    module Chat
      class ChatCompletionContentPartFileParam < DedalusSDK::Internal::Type::BaseModel
        # @!attribute file
        #   Schema for File.
        #
        #   Fields:
        #
        #   - filename (optional): str
        #   - file_data (optional): str
        #   - file_id (optional): str
        #
        #   @return [DedalusSDK::Models::Chat::ChatCompletionContentPartFileParam::File]
        required :file, -> { DedalusSDK::Chat::ChatCompletionContentPartFileParam::File }

        # @!attribute type
        #   The type of the content part. Always `file`.
        #
        #   @return [Symbol, :file]
        required :type, const: :file

        # @!method initialize(file:, type: :file)
        #   Some parameter documentations has been truncated, see
        #   {DedalusSDK::Models::Chat::ChatCompletionContentPartFileParam} for more details.
        #
        #   Learn about [file inputs](/docs/guides/text) for text generation.
        #
        #   Fields:
        #
        #   - type (required): Literal["file"]
        #   - file (required): File
        #
        #   @param file [DedalusSDK::Models::Chat::ChatCompletionContentPartFileParam::File] Schema for File.
        #
        #   @param type [Symbol, :file] The type of the content part. Always `file`.

        # @see DedalusSDK::Models::Chat::ChatCompletionContentPartFileParam#file
        class File < DedalusSDK::Internal::Type::BaseModel
          # @!attribute file_data
          #   The base64 encoded file data, used when passing the file to the model as a
          #   string.
          #
          #   @return [String, nil]
          optional :file_data, String

          # @!attribute file_id
          #   The ID of an uploaded file to use as input.
          #
          #   @return [String, nil]
          optional :file_id, String

          # @!attribute filename
          #   The name of the file, used when passing the file to the model as a string.
          #
          #   @return [String, nil]
          optional :filename, String

          # @!method initialize(file_data: nil, file_id: nil, filename: nil)
          #   Some parameter documentations has been truncated, see
          #   {DedalusSDK::Models::Chat::ChatCompletionContentPartFileParam::File} for more
          #   details.
          #
          #   Schema for File.
          #
          #   Fields:
          #
          #   - filename (optional): str
          #   - file_data (optional): str
          #   - file_id (optional): str
          #
          #   @param file_data [String] The base64 encoded file data, used when passing the file to the model
          #
          #   @param file_id [String] The ID of an uploaded file to use as input.
          #
          #   @param filename [String] The name of the file, used when passing the file to the model as a
        end
      end
    end

    ChatCompletionContentPartFileParam = Chat::ChatCompletionContentPartFileParam
  end
end
