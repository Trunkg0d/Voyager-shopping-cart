class Product < ApplicationRecord
    belongs_to :shop
    has_many :product_categories
    has_many :categories, through: :product_categories
    default_scope -> {order(created_at: :desc)}
    mount_uploader :image, ImageUploader
end
