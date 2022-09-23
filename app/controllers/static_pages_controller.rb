class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @feed_items = current_user.feed
      @products = Product.all
    end
  end

  def help
  end

  def blog
  end

  def contact
  end

  def catalogue
  end

  def search
    @query = Product.ransack(params[:q])
    @products = @query.result(distinct: true)
  end
end
