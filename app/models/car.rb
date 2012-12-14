class Car < ActiveRecord::Base
  attr_accessible :model, :plate, :load, :current_trip

  has_many :driverships
  has_many :drivers, through: :driverships

  validates :plate, presence: true, Length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :model, presence: true, Length: { maximum: 50 }
  validates_numericality_of :load, :allow_nil => true

  before_destroy :confirm_car_not_in_trip

  def model_plate
    self.model + "|" + self.plate
  end

  def self.page(page)
    paginate :per_page => 10, :page => page,
             :order => 'model'
  end

  private
  def confirm_car_not_in_trip
    unless self.driverships.empty?
      errors.add(:base, "该车有出差记录，无法删除！")
      return false
    end
  end

end
