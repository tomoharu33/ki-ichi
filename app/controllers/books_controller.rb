class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "本を投稿しました。"
    else
      render :new
    end
  end
  
  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path, alert: '不正なアクセスです。'
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "本を更新しました。"
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to user_path(book.user), notice: "本を削除しました。"
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body, :book_image)
  end
end
