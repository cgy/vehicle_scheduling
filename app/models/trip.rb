class Trip < ActiveRecord::Base
  attr_accessible :end, :start, :note
  belongs_to :destination
  has_one :car_driver
  validates :end, presence: true
  validates :start, presence: true
  validates :note, presence: true, Length: { maximum: 50 }
end
