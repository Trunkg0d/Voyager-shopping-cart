class SearchController < ApplicationController
  def index
    @query = Product.ransack(params[:q])
    @products = @query.result(distinct: true)
  end
end
