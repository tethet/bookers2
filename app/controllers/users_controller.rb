class UsersController < ApplicationController
  def show
     #Userの投稿の全てをインスタンスに代入する
      @user = User.find(params[:id])
      @new_book = User.new(user_params)
  end
  
  def create
    @new_book = User.new(user_params)
    @new_book.user_id = current_user.id
    @new_book.save
    redirect_to user_path(@user.id)
  end
    
  
  def edit
    @user = User.find(params[:id])
    
   
    
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
    
  end
  
  def index
    
  end
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
  private
  
  def user_params
    params.permit(:name, :introduction, :profile_image)
  
  end
end

