class RemoveAvailableFromCarDriver < ActiveRecord::Migration
  def up
   remove_column :car_drivers, :available
  end

  def down
  end
end
