class CreateBookAudios < ActiveRecord::Migration[6.1]
  def change
    create_table :book_audios do |t|
      t.string :file
      t.string :audio_type
      t.string :audio_size
      t.timestamps
    end
  end
end
