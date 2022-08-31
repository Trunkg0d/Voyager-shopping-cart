shops = Shop.order(:created_at).take(6)
50.times do
description = "This product is so gud"
shops.each{
    |shop|
    shop.products.create!(name: "Hàng tồn kho", color: "Red", size:"XXL",
        price: 12000, quantity_remain: 5, description: description)
}
end
