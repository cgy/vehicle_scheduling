class Destination < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true, Length: { maximum: 50 }, uniqueness: { case_sensitive: false }

  has_many :trips

end
