class Workership < ActiveRecord::Base
  attr_accessible :trip_id, :worker_id

  belongs_to :trip
  belongs_to :worker

end
