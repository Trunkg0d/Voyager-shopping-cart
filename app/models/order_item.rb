class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :product

    #Sends order details to shop
    def send_shop_order_email
        OrderItemMailer.shop_order(self).deliver_now
    end
end
