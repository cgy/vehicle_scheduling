class Trip < ActiveRecord::Base
  attr_accessible :car_id, :user_ids, :destination_id, :back_time, :departure_time, :note

  belongs_to :drivership
  belongs_to :destination
  belongs_to :note

  has_many :workerships
  has_many :workers, through: :workerships

end
