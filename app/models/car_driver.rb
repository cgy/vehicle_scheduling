class CarDriver < ActiveRecord::Base
  attr_accessible :available
  has_one :car
  has_one :user
  belongs_to :trip
end
