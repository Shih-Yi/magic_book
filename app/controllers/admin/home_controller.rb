class Admin::HomeController < Admin::BaseController
  def index
    redirect_to admin_books_path
  end
end
