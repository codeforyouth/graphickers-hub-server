class Image < ApplicationRecord
    belongs_to :graphicker

    validates :user, presence: true
    validates :tag, presence: true
    validates :data, presence: true
end
