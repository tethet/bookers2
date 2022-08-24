class BooksController < ApplicationController
  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
    

  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
   else
     @user = current_user
     @books = Book.all
     render :index   #エラーを表示させたいならrender
   end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  def show
    @book_show = Book.find(params[:id])
    @user = current_user
    @book = Book.new
  end
  
  def edit
    @book = Book.find(params[:id])
    
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    flash[:notice] ="You have updated book successfully."
    redirect_to book_path(@book.id)
    
  end

  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end