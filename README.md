# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* Features for Shopping Cart
- Sign up shop
- Signin/ Signout with user account
- Edit shop infor
- Register shop product
- Edit product
- Destroy product
- Upload many images to product
// List order of customers //

- Model Category 
- Model Category many to many with product through product_category
- Using db seed to set master data

- Home page 
- List categories: each categories show 5 latest products
// Homepage: menu categories: Menu of web
- Category page: List all products of categories
- Product details
- Search product by name: List product by name 

- Sign up customer
- Signin/Signout customer
- Edit customer profile
- Add to cart
- Update date cart
- Finish order:
    - store order to database
    - send email to shop, customer
// List orders history of customer

*********************************
TEST:
- User
    + Sign up
    + Activate mail
    + Log in
    + Log out
    + Reset password
    + Reset password mail
    + Edit profile
    + Create new shop
    + View shop profile
    + View product
    + Add to cart item
    + Update cart item
    + Delete cart item
    + Finish order (checkout)
    + View order history
- Shop
    + Create new product
    + Upload product images
    + Add size, color, category to product
    + Edit product:
        ++ Edit product infor
        ++ Edit product quantity
        ++ Edit product status: Public, Sale
    + Delete product
- Homepage
    + Search product by name (if product no public, it will not show)
    + Filter product by shop name, by category and size
    + Category page
    + Order history
    + Profile shop/ user
    + Follow shop
- Mailer
    + Activate account
    + Reset password
    + Customer order
    + Order mail to shop


