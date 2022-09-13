class CartItem < ApplicationRecord
    belongs_to :cart_session
    belongs_to :product, dependent: :destroy
end
