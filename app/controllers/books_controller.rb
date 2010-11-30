class BooksController < ApplicationController
  def index
	@books = Book.all
  end

  def show
	@book = Book.find params[:id]
	#@readers = @book.reader esto va en el modelo
  end

  def create
	@book=Book.new(params[:book])

	if @book.save
		redirect_to books_path
	else
		render :action =>"new"
	end
  end

  def new
	@book = Book.new
  end

  def search
  end

  def update
	@book = Book.find params[:id]
	@user = User.find params[:user_id]
	@user.read book
	redirect_to @book
  end

  def destroy
        @book = Book.find params[:id]
        @user = User.find params[:user_id]
        @user.forget @book
	redirect_to @book
  end

end
