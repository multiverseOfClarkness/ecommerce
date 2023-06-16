class Product < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true, length: { minimum: 10 }
    validates :price, presence: true, numericality: { only_float: true }
    validates :quantity, presence: true, numericality: { only_integer: true }

    has_many :line_items
    has_many :carts, through: :line_items
end
