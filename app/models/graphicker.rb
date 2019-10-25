class Graphicker < ApplicationRecord
  has_secure_password # add by bcrypt. use password, password_confirmation
  has_secure_password :token, validations: false
  has_many :portfolio
  has_one :image

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 8 }

  def set_token(token)
    self.update_attribute(:token, token)
  end

  def destroy_token
    self.update_attribute(:token, nil)
  end

  def generate_login_output(raw_token)
    {
      id: self.id,
      name: self.name,
      email: self.email,
      image_id: self.image_id,
      created_at: self.created_at,
      updated_at: self.updated_at,
      token: raw_token
    }
  end

  # static methods
  def self.generate_token
    SecureRandom.urlsafe_base64(32)
  end
end
