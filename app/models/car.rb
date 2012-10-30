class Car < ActiveRecord::Base
  attr_accessible :model, :plate, :current_trip
  has_many :trip

  validates :plate, presence: true, Length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :model, presence: true, Length: { maximum: 50 }
end
