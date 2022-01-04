class User::BooksController < User::BaseController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = current_user.books.all
    respond_to do |format|
      format.html
      format.json { render json: @books.to_json }
    end
  end

  def show
  end

  def new
    @book = Book.new
    @book.attachments.build
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save!
      flash[:success] = "Create Success"
      redirect_to user_books_path
    else
      render :action => :new
    end
  end

  def edit
  end

  def update
    begin
      @book.update!(book_params)
    rescue ActiveRecord::RecordInvalid => e
      flash[:danger] = e.message + "上傳失敗，圖片超過5MB"
      redirect_to user_books_path and return
    end
    flash[:success] = "Successfully"
    redirect_to user_books_path
  end

  def destroy
    @book.destroy
    render status: 200, json: { result: '刪除成功' }
  end

  private

  def set_book
    @book = current_user.books.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :images => [], :attachments_attributes => [:id, :image, :description, :_destroy])
  end

end
