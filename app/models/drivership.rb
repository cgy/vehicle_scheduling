class Drivership < ActiveRecord::Base
  belongs_to :car
  belongs_to :driver

  has_many :trips

end
