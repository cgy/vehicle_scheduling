class Driver < User

  has_many :driverships
  has_many :cars, through: :driverships


end