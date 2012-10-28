class Trip < ActiveRecord::Base
  attr_accessible :back_time, :car_driver_id, :departure_time, :destination_id, :note
  belongs_to :car_driver
  belongs_to :destination
  has_and_belongs_to_many :member

end
