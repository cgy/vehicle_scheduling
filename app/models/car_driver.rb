class CarDriver < ActiveRecord::Base
  attr_accessible :car_id, :driver_id
  belongs_to :car
  belongs_to :user
end
