class ProductsController < ApplicationController

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

    private
        def product_params
            params.require(:product).permit(:name, :color, :size, :price, :quantity_remain, :description, :image)
        end
end
