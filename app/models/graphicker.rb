class Graphicker < ApplicationRecord
  include Rails.application.routes.url_helpers
  has_secure_password # add by bcrypt. use password, password_confirmation
  has_secure_password :token, validations: false
  has_many :portfolio
  has_one_attached :avatar

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, uniqueness: true, allow_blank: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }, allow_blank: true
  validates :password, length: { minimum: 8 }, allow_blank: true

  def avatar_url
    avatar.attached? ? url_for(avatar.variant(resize: "512x362").processed) : nil
  end

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
      introduction: self.introduction,
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
