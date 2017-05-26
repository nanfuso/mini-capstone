class Image < ApplicationRecord
    belongs_to :compter
    validates :url, presence: true
end
