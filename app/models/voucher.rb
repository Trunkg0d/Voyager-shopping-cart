class Voucher < ApplicationRecord
    belongs_to :shop
    validates :code, presence: true, length: {minimum: 5}
end
