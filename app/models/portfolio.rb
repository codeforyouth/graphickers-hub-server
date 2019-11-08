class Portfolio < ApplicationRecord
    has_one :image
    belongs_to :graphicker
    
    validates :title, presence: true
    validates :show, presence: true
end
