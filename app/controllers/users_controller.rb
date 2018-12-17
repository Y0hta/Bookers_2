class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @user = current_user 
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book_ = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:notice] = "User profile was successfully updated."
    else
      render :edit 
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :introduction, :image)
  end
end
