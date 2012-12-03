class Trip < ActiveRecord::Base
  attr_accessible :drivership_id, :destination_id, :note_id, :back_time, :departure_time, :workers_ids

  belongs_to :drivership
  belongs_to :destination
  belongs_to :note

  has_many :workerships
  has_many :workers, through: :workerships

  has_one :car, through: :drivership
  has_one :driver, through: :drivership

  def workerslist
    workerslist = []
    self.workers.each do |worker|
      workerslist << worker.name
    end
    workerslist.join("，")
  end

end
