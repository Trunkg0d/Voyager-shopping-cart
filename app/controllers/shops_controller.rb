class ShopsController < ApplicationController
    before_action :edit_other_shop, only: [:edit, :update]
    def index
    end

    def show
        @shop = Shop.find(params[:id]) 
        @products = @shop.products.paginate(page: params[:page])
    end

    def new
        @shop = Shop.new
    end

    def create
        @shop = Shop.new(shop_params)
        @shop.user_id = session[:user_id]
        @user = User.find_by(id: session[:user_id])
        if @shop.save
            @user.update_attribute(:role,2)
            flash[:success] = "Welcome to your Shop"
            redirect_to @shop
        else
            @feed_items = current_user.feed.paginate(page: params[:page])
            render 'new'
        end
    end

    def edit
        @shop = Shop.find(params[:id]) 
    end

    def update
        @shop = Shop.find(params[:id])
        if @shop.update(shop_params)
            flash[:success] = "Updated your Shop"
            redirect_to @shop
        else
            render "edit"
        end
    end

    def destroy
    end

    #Shop product
    def add_product
        @product = current_shop.products.build if logged_in?
    end

    private
        def shop_params
            params.require(:shop).permit(:name, :description, :avatar, :user_id)
        end

        def edit_other_shop
            if request.path != edit_shop_path(current_shop)
                flash[:danger] = "Can not edit another shop"
                redirect_to current_shop
            end
        end
end