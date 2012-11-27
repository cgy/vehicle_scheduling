class Workership < ActiveRecord::Base
  belongs_to :trip
  belongs_to :worker
end
