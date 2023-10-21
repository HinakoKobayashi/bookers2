class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]


  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully!"
      redirect_to book_path(@book)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
  end

  def edit
    user = User.find(params[:id])
   unless user.id == current_user.id
    redirect_to books_path
   end

    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have created book successfully!"
    redirect_to book_path(params[:id])
    else
    render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path(params[:id])
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
