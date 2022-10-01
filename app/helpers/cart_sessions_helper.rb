module CartSessionsHelper
    def first_cart_session
        current_user.cart_sessions.first
    end

    def current_cart_session
        current_user.cart_sessions.last
    end

    def count_cart_sessions
        current_user.cart_sessions.count
    end

    def check_quantity_cart(cart_session)
        check = [true, 0]
        cart_items = cart_session.cart_items
        for i in (0...cart_items.length())
          total = cart_items[i].quantity
          for j in (i+1...cart_items.length())
            if cart_items[i].product == cart_items[j].product
              if cart_items[i].size == cart_items[j].size
                total += cart_items[j].quantity
              end
            end 
          end
          cart_items[i].product.product_sizes.each do |product_size|
            if cart_items[i].size == product_size.size.name 
              if total > product_size.quantity
                check[0] = false
                check[1] = cart_items[i]
                break
              end
            end
          end
        end  
        return check
    end
end
