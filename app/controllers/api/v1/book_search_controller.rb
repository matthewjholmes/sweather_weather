class Api::V1::BookSearchController < ApplicationController

  def index
    quant = params[:quantity].to_i
    if quant.is_a?(Integer) && quant > 0
      books_search_results = BookSearchFacade.book_search_by_location(params[:location], params[:quantity])
      render json: books_search_results
    else
      render json: { errors: 'Try again with a quantity greater than 0.'}
    end
  end

end
