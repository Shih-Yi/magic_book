class CreateBookImageAttachments < ActiveRecord::Migration[6.1]
  def change
    create_table :book_image_attachments do |t|
      t.integer :book_id, :index => true
      t.string :attachment
      t.text :description
      t.timestamps
    end
  end
end
