class ProductsController < ApplicationController
    before_action :createCartSession, only: [:getProduct ]
    def index
        @products = Product.all
    end

    def show
        @product = Product.find_by(id: params[:id])
    end

    def create
        @product = current_shop.products.build(product_params)
        if @product.save
            flash[:success] = "Product created!"
            redirect_to shop_path(current_shop.id)
        else
            render 'static_pages/home'
        end        
    end

    def edit
        @product = Product.find_by(id: params[:id], shop: current_shop)
    end

    def update
        @product = Product.find_by(id: params[:id], shop: current_shop)
        if @product.update(product_params)
            flash[:success] = "Product updated successfully."
            redirect_to shop_path(current_shop)
        else
            render 'edit'
        end
    end

    def destroy
        Product.find_by(id: params[:id], shop: current_shop).destroy
        flash[:success] = "Product deleted"
        redirect_to shop_path(current_shop)
    end

    def getProduct
        @product = Product.find(params[:id])
        puts "Hello"
        puts @product
        getId(@product)
    end

    def createCartSession
        if(!first_cart_session)
            @cart_session = CartSession.new
            @cart_session.user_id = session[:user_id]
            @cart_session.save
        end
    end

    private
        def product_params
            params.require(:product).permit(:name, :color, :size, :price, :quantity_remain, :description, :image, category_ids:[])
        end
end
