class Worker < User

  has_many :workerships
  has_many :trips, through: :workerships


end