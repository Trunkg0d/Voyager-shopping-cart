# Preview all emails at http://localhost:3000/rails/mailers/order_item_mailer
class OrderItemMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/order_item_mailer/shop_order
  def shop_order
    order_item = OrderItem.first
    OrderItemMailer.shop_order(order_item)
  end

end
