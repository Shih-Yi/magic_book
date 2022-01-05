class HomeController < ApplicationController
  def index
    @books = Book.public_books.includes(:attachments).first(100)
  end
end
