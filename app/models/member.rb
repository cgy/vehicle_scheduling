class Member < ActiveRecord::Base
  attr_accessible :group_id, :name
  belongs_to :group
  has_many :trip_members
end
