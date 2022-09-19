module ProductsHelper
    $current_product_id

    def getId(product)
        $current_product_id = product.id 
    end

    def current_product
        @current_product = Product.find($current_product_id)
    end

    def isPublic?(product)
        if product.public == 1 && product.shop.user == current_user
            return true
        end
        return false
    end
end
