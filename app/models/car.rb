class Car < ActiveRecord::Base
  attr_accessible :model, :plate, :limit, :current_trip

  has_many :driverships
  has_many :drivers, through: :driverships

  validates :plate, presence: true, Length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :model, presence: true, Length: { maximum: 50 }
end
