class BookAudio < ApplicationRecord
  mount_uploader :audio, BookAudioUploader
  # relationships .............................................................

  # before_action .............................................................
  before_save :check_audio_size
  before_save :update_audio_attributes
  # public instance methods ...................................................
  
  # private instance methods ..................................................
  private

  def check_audio_size
    if self.present? && self.audio.file.size > 30_720_000
      raise ActiveRecord::RecordInvalid.new(self)
    end
  end

  def update_audio_attributes
    if audio.present? && audio_changed?
      self.audio_type = audio.file.content_type
      self.audio_size = audio.file.size
    end
  end
end
