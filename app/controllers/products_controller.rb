class ProductsController < ApplicationController

    def index
    end

    def show
        @product = Product.find_by(id: params[:id], shop: current_shop)
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
    end

    def update
    end

    def destroy
    end

    private
        def product_params
            params.require(:product).permit(:name, :color, :size, :price, :quantity_remain, :description, :image)
        end
end
