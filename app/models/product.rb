class Product < ApplicationRecord
    belongs_to :shop
    has_many :product_categories
    has_many :categories, through: :product_categories
    has_one :cart_item, dependent: :destroy
    default_scope -> {order(created_at: :desc)}
    mount_uploaders :images, ImageUploader
    serialize :images

    validates :name, presence: true
    validates :size, presence: true
    validates :color, presence: true
    validates :quantity_remain, presence: true
    validates :images, presence: true
end
