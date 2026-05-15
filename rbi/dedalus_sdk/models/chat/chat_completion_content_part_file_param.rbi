# typed: strong

module DedalusSDK
  module Models
    ChatCompletionContentPartFileParam =
      Chat::ChatCompletionContentPartFileParam

    module Chat
      class ChatCompletionContentPartFileParam < DedalusSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              DedalusSDK::Chat::ChatCompletionContentPartFileParam,
              DedalusSDK::Internal::AnyHash
            )
          end

        # Schema for File.
        #
        # Fields:
        #
        # - filename (optional): str
        # - file_data (optional): str
        # - file_id (optional): str
        sig do
          returns(DedalusSDK::Chat::ChatCompletionContentPartFileParam::File)
        end
        attr_reader :file

        sig do
          params(
            file:
              DedalusSDK::Chat::ChatCompletionContentPartFileParam::File::OrHash
          ).void
        end
        attr_writer :file

        # The type of the content part. Always `file`.
        sig { returns(Symbol) }
        attr_accessor :type

        # Learn about [file inputs](/docs/guides/text) for text generation.
        #
        # Fields:
        #
        # - type (required): Literal["file"]
        # - file (required): File
        sig do
          params(
            file:
              DedalusSDK::Chat::ChatCompletionContentPartFileParam::File::OrHash,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Schema for File.
          #
          # Fields:
          #
          # - filename (optional): str
          # - file_data (optional): str
          # - file_id (optional): str
          file:,
          # The type of the content part. Always `file`.
          type: :file
        )
        end

        sig do
          override.returns(
            {
              file: DedalusSDK::Chat::ChatCompletionContentPartFileParam::File,
              type: Symbol
            }
          )
        end
        def to_hash
        end

        class File < DedalusSDK::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                DedalusSDK::Chat::ChatCompletionContentPartFileParam::File,
                DedalusSDK::Internal::AnyHash
              )
            end

          # The base64 encoded file data, used when passing the file to the model as a
          # string.
          sig { returns(T.nilable(String)) }
          attr_reader :file_data

          sig { params(file_data: String).void }
          attr_writer :file_data

          # The ID of an uploaded file to use as input.
          sig { returns(T.nilable(String)) }
          attr_reader :file_id

          sig { params(file_id: String).void }
          attr_writer :file_id

          # The name of the file, used when passing the file to the model as a string.
          sig { returns(T.nilable(String)) }
          attr_reader :filename

          sig { params(filename: String).void }
          attr_writer :filename

          # Schema for File.
          #
          # Fields:
          #
          # - filename (optional): str
          # - file_data (optional): str
          # - file_id (optional): str
          sig do
            params(
              file_data: String,
              file_id: String,
              filename: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The base64 encoded file data, used when passing the file to the model as a
            # string.
            file_data: nil,
            # The ID of an uploaded file to use as input.
            file_id: nil,
            # The name of the file, used when passing the file to the model as a string.
            filename: nil
          )
          end

          sig do
            override.returns(
              { file_data: String, file_id: String, filename: String }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
