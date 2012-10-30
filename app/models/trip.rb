class Trip < ActiveRecord::Base
  attr_accessible :car_id, :user_id, :destination_id, :back_time, :departure_time, :note
  belongs_to :car
  belongs_to :user
  belongs_to :destination
  has_many :trip_members

end
