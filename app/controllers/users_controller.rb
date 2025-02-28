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
    unless @user == current_user
    redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
    redirect_to user_path(current_user.id)
    else
    render :edit
    end
  end


  private

  def user_params
  params.require(:user).permit(:profile_image, :name, :introduction )
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end


end

