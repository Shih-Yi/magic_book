class AddImageTypeAndImageSizeToBookImageAttachments < ActiveRecord::Migration[6.1]
  def change
    add_column :book_image_attachments, :image_type, :string
    add_column :book_image_attachments, :image_size, :string
    rename_column :book_image_attachments, :attachment, :image
  end
end
