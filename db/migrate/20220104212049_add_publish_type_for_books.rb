class AddPublishTypeForBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :publish_type, :int, default: 0
  end
end
