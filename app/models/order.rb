class Order < ApplicationRecord
    belongs_to :compter, optional: true
    belongs_to :user

    def price_with_quantity
        @price = compter.price * quantity
    end

    def tax_with_quantity
        @tax = @price * 0.09
    end

    def subtotal_with_quantity
        @price + @tax
    end
end
