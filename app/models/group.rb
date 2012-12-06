class Group < ActiveRecord::Base
  attr_accessible :name

  has_many :workers


  scope :worker_options, lambda { |trip_id| Worker.where("current_trip = ? OR current_trip = ?", trip_id, 0) }

end
