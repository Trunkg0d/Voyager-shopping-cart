Rails.application.routes.draw do
  root "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/contact", to: "static_pages#contact"
  get "/blog", to: "static_pages#blog"
  get "/cart", to: "static_pages#cart"

  get "/signup", to: "users#new"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create' 
  delete '/logout', to: 'sessions#destroy'
  resources :users

  #shop
  get '/shop_signup', to: 'shops#new'
  get '/shop_add_product', to: 'shops#add_product'

  #product
  post '/products/:id/add_product', to: 'products#getProduct', as: 'add_product'


  resources :shops
  resources :products
  resources :cart_sessions
  resources :cart_items
end
