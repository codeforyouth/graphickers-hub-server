class Portfolio < ApplicationRecord
    belongs_to :graphicker
    
    validates :title, presence: true
    validates :show, presence: true
end
