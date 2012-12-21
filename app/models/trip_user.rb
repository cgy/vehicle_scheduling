class TripUser < ActiveRecord::Base
  attr_accessible :user_id
  has_many :users

end
