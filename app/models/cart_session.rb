class CartSession < ApplicationRecord
    has_many :cart_items
    belongs_to :user
end
