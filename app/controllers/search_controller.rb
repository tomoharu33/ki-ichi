class SearchController < ApplicationController
  def search
    if @keyword = params[:keyword]
      @books = GoogleBooks.search(@keyword, {:count => 10}).to_a
      # @books = Kaminari.paginate_array(@books).page(params[:page]).per(10)
    end
  end
end
