class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation, :remember_token
  has_secure_password
  has_one :trip
  belongs_to :car_driver

  before_save :create_remember_token

  validates :name, presence: true, Length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end

