class Book < ApplicationRecord
  def index
  end
  def show
  end
  
  belongs_to :user
end
