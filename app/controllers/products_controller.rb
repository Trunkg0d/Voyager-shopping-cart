class ProductsController < ApplicationController
    before_action :createCartSession, only: [:getProduct ]
    def index
        @products = Product.all
    end

    def show
        @product = Product.find_by(id: params[:id])
    end

    def new
    	@product = Product.new 
  	end

    def create
        @product = current_shop.products.build(product_params)
        if @product.save
            flash[:success] = "Product created!"
            redirect_to shop_path(current_shop.id)
        else
            render 'new'
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
        @product = Product.find(params[:id])
        quantity = @product.cart_item.quantity
        price = @product.cart_item.product.price
        total = @product.cart_item.cart_session.sum_money - price * quantity
        @product.cart_item.cart_session.update_attribute(:sum_money, total)
        Product.find_by(id: params[:id], shop: current_shop).destroy
        flash[:success] = "Product deleted"
        redirect_to shop_path(current_shop)
    end

    def getProduct
        @product = Product.find(params[:id])
        getId(@product)
        @cart_item = CartItem.new
        @cart_item.quantity = params[:quantity]
        @cart_item.cart_session_id = current_cart_session.id
        @cart_item.product_id = current_product.id
        if (count_cart_sessions == 2)
          first_cart_session.destroy
        end
        total = @cart_item.cart_session.sum_money
        total += @cart_item.product.price * @cart_item.quantity
        @cart_item.cart_session.update_attribute(:sum_money, total)

        if @cart_item.save
          flash[:success] = "Add product successfully"
        else
          render 'new'
        end

        redirect_to @product
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
            params.require(:product).permit(:name, :color, :size, :price, :quantity_remain, :description, images: [], category_ids:[])
        end
end
