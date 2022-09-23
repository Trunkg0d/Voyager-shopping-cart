module ProductsHelper
    $current_product_id

    def getId(product)
        $current_product_id = product.id 
    end

    def current_product
        @current_product = Product.find($current_product_id)
    end

    def isPublic?(product)
        if product.public == 1
            return true
        end
        return false
    end

    def sumPublic(products)
        sum = 0
        products.each do |product|
            if isPublic?(product) == true
                sum+=1
            end
        end
        sum
    end

    def isSale?(product)
        if product.sale == 1
            return true
        end
        return false
    end
end
