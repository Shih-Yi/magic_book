class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @book.attachments.build
  end

  def create
    @book = Book.new(book_params)
    if @book.save!
      redirect_to books_path
    else
      render :action => :new
    end
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :remove_images, :images => [], :attachments_attributes => [:id, :image, :description, :_destroy])
  end
end
