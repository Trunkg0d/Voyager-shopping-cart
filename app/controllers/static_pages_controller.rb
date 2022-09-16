class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @feed_items = current_user.feed
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
end
