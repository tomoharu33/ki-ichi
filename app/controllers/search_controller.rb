class SearchController < ApplicationController
  before_action :authenticate_user!, except: [:search]

  def search
    if @keyword = params[:keyword]
      @books = GoogleBooks.search(@keyword, {:count => 20}).to_a
      @books = Kaminari.paginate_array(@books).page(params[:page]).per(10)
    elsif @id = params[:id]
      @book = GoogleBooks.search(@id).first
    end
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    # @book.image_link.attach(io: File.open(image_link))
    if @book.save
      redirect_to book_path(@book), notice: "本を投稿しました。"
    else
      render :search
    end
  end

  private
  
  def book_params
    params.permit(:title, :body, :book_image)
  end
end
