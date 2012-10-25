class AddAvailableToCarDrivers < ActiveRecord::Migration
  def change
    add_column :car_drivers, :available, :boolean
  end
end
