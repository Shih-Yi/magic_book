class BookImageAttachment < ApplicationRecord
  mount_uploader :attachment, BookImageAttachmentUploader
  belongs_to :book
end
