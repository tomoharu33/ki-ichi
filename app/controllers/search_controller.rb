class SearchController < ApplicationController
  def search
    if @keyword = params[:keyword]
      @books = GoogleBooks.search(@keyword, {:count => 20}).to_a
      @books = Kaminari.paginate_array(@books).page(params[:page]).per(10)
    end
  end
end
