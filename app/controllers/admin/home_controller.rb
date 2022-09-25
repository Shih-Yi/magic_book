class Admin::HomeController < Admin::BaseController
  def index
    redirect_to admin_book_audios_path
  end
end
