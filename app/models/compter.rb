class Compter < ApplicationRecord
    belongs_to :supplier
    has_many :images
    has_many :category_compters
    has_many :categories, through: :category_compters
    has_many :carted_products
    has_many :orders, through: :carted_products

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :price, presence: true
    validates :price, numericality: true
    validates :description, presence: true
    validates :description, length: { maximum: 500 }
    
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

    def first_image_url
        image_collection = images
        if image_collection.length == 0
            "https://i.giphy.com/ZYm4NC2RJARHO.gif"
        else
        image_collection.first.url
    end
    end

    def show_categories
        categories.map{ |category| category.name }.join(", ")
    end
end
