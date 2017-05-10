class Compter < ApplicationRecord
    def sale_alert
        sale_message = ""
        sale_message = "Discount item!" if price.to_i < 20 
        sale_message = "Everyday Value!" if price.to_i >= 20
        sale_message
    end

    def tax
        tax = price.to_i * 0.09
        tax.round(3)
    end

    def total_price
        price.to_i + tax
    end
end
