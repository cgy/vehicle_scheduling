class Car < ActiveRecord::Base
  attr_accessible :model, :plate, :load, :current_trip

  has_many :driverships
  has_many :drivers, through: :driverships

  validates :plate, presence: true, Length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :model, presence: true, Length: { maximum: 50 }

  def model_plate
    self.model + "|" + self.plate
  end

  def self.page(page)
    paginate :per_page => 10, :page => page,
             :order => 'model'

  end

end
