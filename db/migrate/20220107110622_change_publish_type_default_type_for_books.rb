class ChangePublishTypeDefaultTypeForBooks < ActiveRecord::Migration[6.1]
  def change
    change_column :books, :publish_type, :int, default: 1
  end
end
