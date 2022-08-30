class ShopsController < ApplicationController
    def index
    end

    def show
        @shop = Shop.find(params[:id]) 
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
            render 'new'
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private
        def shop_params
            params.require(:shop).permit(:name, :description, :avatar, :user_id)
        end
end