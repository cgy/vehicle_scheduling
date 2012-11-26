class Trip < ActiveRecord::Base
  attr_accessible :car_id, :user_ids, :destination_id, :back_time, :departure_time, :note
  belongs_to :car
  belongs_to :user
  belongs_to :destination
  has_many :trip_members
  has_many :members, through: :trip_members

end
