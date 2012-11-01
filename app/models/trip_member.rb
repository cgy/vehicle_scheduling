class TripMember < ActiveRecord::Base
  attr_accessible :member_id, :trip_id
  belongs_to :trip
  belongs_to :user
end
