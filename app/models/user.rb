class User < ActiveRecord::Base
  scope :worker, where(:type => "Worker")
  scope :driver, where(:type => "Driver")

  attr_accessible :name, :phone, :group_id, :password, :password_confirmation, :remember_token, :current_trip
  has_secure_password

  before_save :create_remember_token

  belongs_to :group

  validates :name, presence: true, Length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end

