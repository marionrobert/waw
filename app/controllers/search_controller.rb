class SearchController < ApplicationController
  skip_before_action :authenticate_user!

  def set_query
    @query = Product.ransack(params[:q])
    @products = @query.result(distinct: true)
  end
end
