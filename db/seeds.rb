User.create!(name: "Example User",
    email: "example@railstutorial.org",
    phone: "0985879454",
    address: "My Tho, Tien Giang, Viet Nam",
    password: "foobar",
    password_confirmation: "foobar")

25.times do |n|
    name = "Trunk Lee"
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(name: name,
    email: email,
    phone: "0985879454",
    address: "My Tho, Tien Giang, Viet Nam",
    password: password,
    password_confirmation: password)
end

users = User.order(:created_at).take(26)
users.each{
    |user|
    description = "Nike, Inc. is an American multinational corporation that is engaged in the design, development, manufacturing, and worldwide marketing and sales of footwear, apparel, equipment, accessories, and services"
    avatar = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Nike_Flagship_-_NYC_%2848155560636%29.jpg/270px-Nike_Flagship_-_NYC_%2848155560636%29.jpg"
    Shop.create!(name: "Tiki", description: description, avatar: avatar, user_id: user.id )
}

shops = Shop.order(:created_at).take(6)
50.times do
    description = "Designed by Bruce Kilgore and introduced in 1982, the Air Force 1 was the first ever basketball shoe to feature Nike Air technology, revolutionizing the game and sneaker culture forever"
    shops.each{
        |shop|
        for i in 0...3 do
            if i%2 == 0
                image = "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/f2ff7f7a-0e13-4148-8eb4-60b83e86f99b/air-force-1-07-lv8-shoes-BS9f21.png"
            else
                image = "https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/08105925-b788-48d7-8381-99257fcd0281/air-force-1-07-shoes-dbvfjQ.png"
            end
            shop.products.create!(name: "Nike air force 1", color: "Red", size:"XXL",
                price: 15000, quantity_remain: 5, description: description, image: image)
        end
}
end
