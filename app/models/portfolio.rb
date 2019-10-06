class Portfolio < ApplicationRecord
    has_one :image
    
    validates :title, presence: true
    validates :show, presence: true
end
