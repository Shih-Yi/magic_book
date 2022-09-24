class Admin::BookAudiosController < Admin::BaseController
  before_action :set_audio, only: [:show, :edit, :update, :destroy, :download_audio]

  def index
    @audios = BookAudio.all
    respond_to do |format|
      format.html
      format.json { render json: @audios.to_json }
    end
  end

  def new
    @audio = BookAudio.new
  end

  def edit
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

  def update
    begin
      @audio.update!(book_audio_params)
    rescue ActiveRecord::RecordInvalid => e
      flash[:danger] = e.message + "上傳失敗，圖片超過30MB"
      redirect_to admin_book_audios_path and return
    end
    flash[:success] = "Successfully"
    redirect_to admin_book_audios_path
  end

  def destroy
    @audio.destroy
    render status: 200, json: { result: '刪除成功' }
  end

  def download_audio
    if @audio.file.url.nil?
      flash[:alert] = "還沒上傳圖片"
      redirect_to admin_book_audios_path and return
    else
      send_file "#{Rails.root}#{@audio.file.url}", type: "audio/mpeg", x_sendfile: true
    end
  end


  private

  def set_audio
    @audio = BookAudio.find(params[:id])
  end

  def book_audio_params
    params.require(:book_audio).permit(:book_title, :file, :remove_file)
  end
end
