class CartedProduct < ApplicationRecord
    belongs_to :compter
    belongs_to :user
    belongs_to :order, optional: true
    validates :quantity, presence: true
    validates :quantity, numericality: { greater_than: 0 }

    def subtotal
        compter.price * quantity
    end

end
