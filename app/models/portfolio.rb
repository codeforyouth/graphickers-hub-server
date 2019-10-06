class Portfolio < ApplicationRecord
    validates :title, presence: true
    validates :show, presence: true
end
