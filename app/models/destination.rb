class Destination < ActiveRecord::Base
  attr_accessible :name
  has_many :trip
end
