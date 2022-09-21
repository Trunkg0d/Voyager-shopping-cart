class ApplicationController < ActionController::Base
    include SessionsHelper 
    include ProductsHelper
    include CartSessionsHelper
    before_action :set_query

    def set_query
        @query = Product.ransack(params[:q])
    end
end
