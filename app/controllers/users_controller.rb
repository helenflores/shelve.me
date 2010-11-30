class UsersController < ApplicationController
  def show
	@user=User.fine params[:id]
	@books = @user.books
  end

end
