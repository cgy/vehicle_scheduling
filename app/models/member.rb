class Member < ActiveRecord::Base
  attr_accessible :group_id, :name
  belongs_to :group
  has_and_belongs_to_many :trip
end
