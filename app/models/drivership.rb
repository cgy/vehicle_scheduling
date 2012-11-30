class Drivership < ActiveRecord::Base
  attr_accessible :car_id, :driver_id

  belongs_to :car
  belongs_to :driver

  has_many :trips

  def driver_name
    self.driver.name
  end

end
