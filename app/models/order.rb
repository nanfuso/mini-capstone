class Order < ApplicationRecord
    belongs_to :user
    has_many :carted_products
    has_many :compters, through: :carted_products

    



end
