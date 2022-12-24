class SearchController < ApplicationController
  def set_query
    @query = Product.ransack(params[:q])
    @products = @query.result(distinct: true)
  end
end
