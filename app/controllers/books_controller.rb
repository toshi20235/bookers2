class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to user_path(id: current_user)
    else book = Book.new
    book.save
    flash[:notice] = "Signed in successfully."
    end
  end
  def index
    @user = current_user
    @books = Book.all
  end
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end
   def show
     @user = User.find(params[:id]) 
     @books = @user.books
   end
   def edit
     @book = Book.find(params[:id])
   end
   
    def update
    @book =  Book.find(params[:id]) 
    @book.update(book_params)
    redirect_to book_path
    book = Book.new
    book.save
    flash[:notice] = "You have updated user successfully."
    end
   
 private

  def book_params
    params.require(:book).permit(:title, :opinion,:image)
  end
end
