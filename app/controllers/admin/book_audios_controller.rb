class Admin::BookAudiosController < Admin::BaseController

  def index
    @audios = BookAudio.all
    respond_to do |format|
      format.html
      format.json { render json: @audios.to_json }
    end
  end

  def new
    @audios = BookAudio.new
  end

  def create
    @audio = BookAudio.new(book_audio_params)
    @audio.uploader_name = current_admin_user.email.split("@")[0]
    if @audio.save!
      redirect_to admin_book_audios_path
    else
      render :action => :new
    end
  end

  private

  def book_audio_params
    params.require(:book_audio).permit(:book_title, :file, :remove_audio_file)
  end
end
