class BookImageAttachment < ApplicationRecord
  mount_uploader :attachment, BookImageAttachmentUploader
  # relationships .............................................................
  belongs_to :book

  # public instance methods ...................................................
end
