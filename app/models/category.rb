class Category < ApplicationRecord
    has_many :category_compters
    has_many :compters, through: :category_compters
    validates :name, uniqueness: true
end
