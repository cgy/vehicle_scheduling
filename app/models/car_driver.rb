class CarDriver < ActiveRecord::Base
  has_one :car
  has_one :user
end
