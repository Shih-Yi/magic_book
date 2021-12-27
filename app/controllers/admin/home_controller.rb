class Admin::HomeController < Admin::BaseController
  def index
    @books = Book.all
    respond_to do |format|
      format.html
      format.json { render json: @books.to_json }
    end
  end
end
