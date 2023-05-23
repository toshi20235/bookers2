class UsersController < ApplicationController
  # before_action :correct_user, only: [:edit]
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def index
     @users = User.all
  end
  
  def show
     @user = User.find(params[:id]) 
     @books = @user.books
    
  end

  def edit
    @user = User.find(params[:id])
    @use = User.new
  end
  def update
    @user= User.find(params[:id])
   if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      user = User.new
      user.save
      redirect_to user_path(@user.id)
   else
     render :edit
   end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction )
  end
  
   def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
   end
  # def correct_user
  #   @user = User.find(params[:id])
  #   redirect_to  unless @user == current_user
  # end
end