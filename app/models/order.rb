class Order < ApplicationRecord
    belongs_to :user
    has_many :carted_products
    has_many :compters, through: :carted_products

    def subtotal_with_quantity
        self.subtotal = compter.price * quantity
    end

    def tax_with_quantity
        self.tax = subtotal * 0.09
    end

    def total_with_quantity
        self.total = subtotal + tax
    end
end
