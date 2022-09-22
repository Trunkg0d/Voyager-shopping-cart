class OrderItemMailer < ApplicationMailer
    def shop_order(order_item)
        @order_item = order_item
        mail to: order_item.product.shop.user.email, subject: "Order Details"
    end
end
