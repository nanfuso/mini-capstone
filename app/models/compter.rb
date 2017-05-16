class Compter < ApplicationRecord
    belongs_to :supplier
    
    def sale_alert
        if discounted?
            "Discount item!!"
        else
            "Everyday Value!!"
        end
    end

    def discounted?
        price < 100
    end

    def tax
        price * 0.09
    end

    def total_price
        price + tax
    end
end
