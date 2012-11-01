class User < ActiveRecord::Base
  attr_accessible :name, :phone, :group_id, :user_type, :password, :password_confirmation, :remember_token, :current_trip
  has_secure_password

  has_many :trips
  has_many :car_drivers
  has_many :trip_members
  belongs_to :group

  before_save :create_remember_token

  validates :name, presence: true, Length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end

