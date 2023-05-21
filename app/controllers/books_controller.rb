class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to user_path(id: current_user)
  end
  def index
    @user = current_user
    @books = Book.all
  end
 private

  def book_params
    params.require(:book).permit(:title, :opinion,:image)
  end
end
