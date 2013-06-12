class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :nickname, :thumb, :explain, :delflg
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,  presence: true, length: {maximum: 32}
  validates :email,  presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: { minimum: 6 }

  before_save { |user| user.email = email.downcase }
  #before_save :create_remember_token

  after_validation { self.errors.messages.delete(:password_digest) }

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
