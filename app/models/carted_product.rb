class CartedProduct < ApplicationRecord
    belongs_to :compter
    belongs_to :user
    belongs_to :order, optional: true

end
