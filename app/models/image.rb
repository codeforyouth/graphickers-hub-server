class Image < ApplicationRecord
    validates :user, presence: true
    validates :tag, presence: true
    validates :data, presence: true
end
