class UsersController < ApplicationController
  def index
    @user = current_user
    @book_new = Book.new
    @users = User.all
  end


  def show
    @user = User.find(params[:id])
    @book_new = Book.new
    @books = @user.books
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user.id)
  end


  private

  def user_params
  params.require(:user).permit(:profile_image, :name, :introduction )
  end

end

