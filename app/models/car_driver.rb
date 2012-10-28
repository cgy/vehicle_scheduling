class CarDriver < ActiveRecord::Base
  attr_accessible :available, :car_id, :driver_id
  belongs_to :car
  belongs_to :user
  has_one :trip
end
