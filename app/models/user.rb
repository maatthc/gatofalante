class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  # To guarantee the format is always the same
  before_save {email.downcase!}

  validates :first_name, presence: true, length: {maximum: 20}
  validates :last_name, presence: true, length: {maximum: 20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 8}

  #Helper to deal with passwords
  has_secure_password

  # Returns the hash digest of the given string. CLASS Method will be used with the fixtures for integration test for login
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
