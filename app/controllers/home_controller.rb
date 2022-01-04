class HomeController < ApplicationController
  def index
    @books = Book.includes(:attachments).first(100)
  end
end
