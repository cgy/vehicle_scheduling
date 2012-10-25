class Trip < ActiveRecord::Base
  attr_accessible :end, :start, :note
  belongs_to :destination
  belongs_to :car
  belongs_to :user
  validates :end, presence: true
  validates :start, presence: true
  validates :note, presence: true, Length: { maximum: 50 }
end
