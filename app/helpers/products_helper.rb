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

    def size_filter(product, size)
        if size.nil?
            return true
        else
            product.size_ids.each do |size_id|
                if size[:commands].include?(Size.find(size_id).name)
                    return true
                    break
                end
            end 
            return false
        end
    end

    def brand_filter(product, brand)
        if brand.nil?
            return true
        else
            if brand[:commands].include?(product.shop.name)
                return true
            else
                return false
            end
        end
    end

    def category_filter(product, category)
        if category.nil?
            return true
        else
            product.category_ids.each do |category_id|
                if category[:commands].include?(Category.find(category_id).name)
                    return true
                    break
                end
            end 
            return false
        end
    end

    def filter(product, brand, size, category)
        if brand.nil? && size.nil? && category.nil?
            return false
        end
        return brand_filter(product, brand) && size_filter(product, size) && category_filter(product, category)
    end
end
