class Graphicker < ApplicationRecord
  has_secure_token # add by bcrypt. use password, password_confirmation
  has_secure_password
  has_one :image

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
end
