class Group < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true, Length: { maximum: 50 }, uniqueness: { case_sensitive: false }

  has_many :workers

  before_destroy :confirm_no_workers_in_group

  def size
    self.workers.size
  end

  private
  def confirm_no_workers_in_group
    unless self.workers.empty?
      errors.add(:base, "该班组包含成员，无法删除！")
      return false
    end
  end

end
