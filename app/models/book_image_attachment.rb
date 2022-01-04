class BookImageAttachment < ApplicationRecord
  mount_uploader :image, BookImageAttachmentUploader
  # relationships .............................................................
  belongs_to :book

  # before_action .............................................................
  before_save :check_image_size
  # public instance methods ...................................................
  
  # private instance methods ..................................................
  private
  
  def check_image_size
    if self.present? && self.image.file.size > 5120_000
      raise ActiveRecord::RecordInvalid.new(self)
    end
  end
end
