class Destination < ActiveRecord::Base
  attr_accessible :name
  has_one :trip
end
