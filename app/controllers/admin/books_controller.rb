class Admin::BooksController < Admin::BaseController
  before_action :set_book, only: [:show, :destroy, :update_status]

  def index
    @books = Book.all
    respond_to do |format|
      format.html
      format.json { render json: @books.to_json }
    end
  end

  def update_status
    case @book.publish_type
    when 'unpublished'
      @book.published!
    when 'published'
      @book.unpublished!
    end
    render status: 200, json: { result: "update Successfully", status: @book.publish_type, id: @book.id }
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end
end
