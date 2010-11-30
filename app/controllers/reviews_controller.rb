class ReviewsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :edit, :edit, :update, :destroy]
  def index
  end

  def show
  end

  def new
	@book = Book.find params[:book_id]
	@review = Review.new
	@review.book = @book
	@review.user = current_user
	#redirect_to new_user_session_path unless user_signed_in?
  end

  def create
	@book = Book.find params[:book_id]
	@review = Review.new params[:review]
	@review.user = current_user
	@review.book = @book

	if @review.save
		unless @book.readers.empty?
			ReviewsMailer.new_review_email(@review).deliver
		end
		redirect_to book_review_path(@book, @review)
	else
		render :new
	end
  end

  def edit
	#@review = current_user.reviews.find params[:id]
	@book = @review.book
  end

  def update
	@review = current_user.reviews.find params[:id]
	@book = @review.book
	if @review.update_attributes params[:review]
		redirect_to book_review_path(@book, @review)
	else
		render :edit
	end
  end

  def destroy
  end

end
