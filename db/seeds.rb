User.create!(name: "Example User",
    email: "example@railstutorial.org",
    phone: "0985879454",
    address: "My Tho, Tien Giang, Viet Nam",
    password: "foobar",
    password_confirmation: "foobar",
    activated: true,
    activated_at: Time.zone.now)

15.times do |n|
    name = "Trunk Lee"
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(name: name,
    email: email,
    phone: "0985879454",
    address: "My Tho, Tien Giang, Viet Nam",
    password: password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now)
end

users = User.all
shop_name = ["Adidas", "Nike", "New Balance", "Converse", "Vans"]
shop_description = [
    "Impossible is nothing",
    "Just do it",
    "There are two motivations in sports. Which is yours? For Love or Money?",
    "Wear with everything",
    "Off The Wall"
]
users.each{
    |user|
    ran_num = rand(0..4)
    description = shop_description[ran_num]
    avatar = "https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Nike_Flagship_-_NYC_%2848155560636%29.jpg/270px-Nike_Flagship_-_NYC_%2848155560636%29.jpg"
    Shop.create!(name: shop_name[ran_num], description: description, avatar: avatar, user_id: user.id )
}

cates = ["Lifestyle", "Jordan", "Running", "Basketball", "Football", "Training & Gym", "Skateboarding", "Golf", "Tennis",
        "Athletics", "Walking", "Baseball", "Volleyball", "Business", "Dance"]
cates.each do |cate|
    Category.create!(name: cate)
end

sizes = Array(30..50)
sizes.each do |size|
    Size.create!(name: size)
end

colors = ["Black", "Dimgray", "Dimgrey", "Gray", "Grey", "Darkgray", "Darkgrey", "Silver", "Lightgray",
    "Lightgrey", "Gainsboro", "Whitesmoke", "White", "Snow", "Rosybrown", "Lightcoral", "Indianred",
    "Brown", "Firebrick", "Maroon", "Darkred", "Red", "Mistyrose", "Salmon", "Tomato", "Darksalmon",
    "Coral", "Orangered", "Lightsalmon", "Sienna", "Seashell", "Chocolate", "Saddlebrown", "Sandybrown",
    "Peachpuff", "Peru", "Lenen", "Bisque", "Darkorange", "Burlywood", "Antiquewhite", "Tan", "Gold",
    "Navajowhite", "Blanchedalmond", "Papayawhip", "Moccasin", "Orange", "Wheat", "Oldlace", "Floralwhite",
    "Darkgoldenrod", "Goldenrod", "Cornsilk", "Lemonchiffon", "Khaki", "Palegoldenrod", "Darkkhaki,",
    "Ivory", "Beige", "Lightyellow", "Lightgoldenrodyellow", "Olive", "Yellow", "Olivedrab", "Yellowgreen",
    "Darkolivegreen", "Greenyellow", "Chartreuse", "Lawngreen", "Honeydrew", "Darkseagreen", "Palegreen",
    "Lightgreen", "Forestgreen", "Limegreen", "Darkgreen", "Green", "Lime", "Seagreen", "Mediumseagreen",
    "Springgreen", "Mediumspringgreen", "Mintcream", "Mediumaquamarine", "Aquamarine", "Turquoise",
    "Lightseagreen", "Mediumturquoise", "Azure", "Lightcyan", "Paleturquoise", "Darkslategray", "Darkslategrey",
    "Teal", "Darkcyan", "Aqua", "Cyan", "Darkturquoise", "Cadetblue", "Powderblue", "Lightblue", "Deepskyblue",
    "Skyblue", "Lightskyblue", "Steelblue", "Aliceblue", "Dodgerblue", "Lightslategray", "Lightslategrey",
    "Slategray", "Slategrey", "Lightsteelblue", "Cornflowerblue", "Royalblue", "Ghostwhite", "Lavender",
    "Midnightblue", "Navy", "Darkblue", "Mediumblue", "Blue", "Slateblue", "Darkslateblue", "Mediumslateblue",
    "Mediumpurple", "Rebeccapurple", "Blueviolet", "Indigo", "Darkorchid", "Darkviolet", "Mediumorchid",
    "Thistle", "Plum", "Violet", "Purple", "Darkmagenta", "Fuchsia", "Magenta", "Orchid", "Mediumvioletred",
    "Deeppink", "Hotpink", "Lavenderblush", "Palevioletred", "Crimson", "Pink", "Lightpink"]
colors.each do |color|
    Color.create!(name: color)
end
# Create following relationships.
users = User.all
user = users.first
following = users[2..10]
followers = users[3..15]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }


users = User.all
users.each do |user|
    user.shop.products.create!(name: "Nike KD 15", price: 150, description:"Limited edition",public: 1, size_ids:[5,7,10],color_ids:[1,13])
    user.shop.products.create!(name: "Nike Air Force 1", price: 150, description:"Limited edition",public: 1, size_ids:[5,7,10],color_ids:[1,13])
    user.shop.products.create!(name: "Nike Air Max 90", price: 150, description:"Limited edition",public: 1, size_ids:[5,7,10],color_ids:[1,13])
    user.shop.products.create!(name: "Nike Infinity", price: 150, description:"Limited edition",public: 1, size_ids:[5,7,10],color_ids:[1,13]) 
end