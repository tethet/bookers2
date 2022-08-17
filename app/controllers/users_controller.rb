class UsersController < ApplicationController
  def show
  end
  
  def edit
    @user = User.new
    
    
  end
end
