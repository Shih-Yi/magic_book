class Book < ApplicationRecord
  mount_uploaders :images, BookImageUploader
  serialize :images, JSON

  # relationships .............................................................
  has_many :attachments, :class_name => "BookImageAttachment", :dependent => :destroy
  belongs_to :user

  accepts_nested_attributes_for :attachments, :allow_destroy => true, :reject_if => :all_blank

  # scope .....................................................................
  scope :public_books, -> { where(publish_type: 1) }

  enum publish_type: {
    unpublished: 0,
    published: 1,
  }

  # public instance methods ...................................................
  def cover_image
    attachments.first.image.url
  end
end
