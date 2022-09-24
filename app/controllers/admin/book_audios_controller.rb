class Admin::BookAudiosController < Admin::BaseController

  def index
    @audios = BookAudio.all
    respond_to do |format|
      format.html
      format.json { render json: @audios.to_json }
    end
  end
end
