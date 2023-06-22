class BookAudio < ApplicationRecord
  mount_uploader :file, BookAudioUploader
  # relationships .............................................................

  # before_action .............................................................
  before_save :check_audio_size
  before_save :update_audio_attributes
  # public instance methods ...................................................
  
  # private instance methods ..................................................
  private

  def check_audio_size
    if self.present? && self.file.size > 51_200_000
      raise ActiveRecord::RecordInvalid.new(self)
    end
  end

  def update_audio_attributes
    if file.present? && file_changed?
      self.audio_type = file.content_type
      self.audio_size = file.size
    end
  end
end
