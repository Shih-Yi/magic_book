class Book < ApplicationRecord
  mount_uploaders :images, BookImageUploader
  serialize :images, JSON

  has_many :attachments, :class_name => "BookImageAttachment", :dependent => :destroy
  belongs_to :user
  accepts_nested_attributes_for :attachments, :allow_destroy => true, :reject_if => :all_blank
end
