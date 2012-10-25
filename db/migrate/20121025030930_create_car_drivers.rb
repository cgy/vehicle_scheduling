class CreateCarDrivers < ActiveRecord::Migration
  def change
    create_table :car_drivers do |t|

      t.timestamps
    end
  end
end
