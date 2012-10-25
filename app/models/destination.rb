class Destination < ActiveRecord::Base
  attr_accessible :name
  has_many :trip
  validates :name, presence: true, Length: { maximum: 50 }, uniqueness: { case_sensitive: false }
end
