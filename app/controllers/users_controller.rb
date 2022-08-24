class UsersController < ApplicationController

  def show
      @user = User.find(params[:id])
      @new_book = Book.new
      @book = @user.books
  end
  
  
  def edit
    @user = User.find(params[:id])
    @users = User.all(user_params)
    @new_book = Book.new
    
   
    
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
     flash[:notice] =  "You have updated user successfully."
    redirect_to user_path(users.id), flash: {success: "You have updated user successfully."}
    
  end
  
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end
  
 
  
  private
  
  def user_params
    params.permit(:name, :introduction, :profile_image)
  
  end
end

