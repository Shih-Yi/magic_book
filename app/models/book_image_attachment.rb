class BookImageAttachment < ApplicationRecord
  mount_uploader :image, BookImageAttachmentUploader
  # relationships .............................................................
  belongs_to :book

  # public instance methods ...................................................
end
