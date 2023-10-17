class BooksController < ApplicationController
  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
  end

  def edit
  end
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  
end
