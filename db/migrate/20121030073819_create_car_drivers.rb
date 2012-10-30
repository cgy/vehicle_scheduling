class CreateCarDrivers < ActiveRecord::Migration
  def change
    create_table :car_drivers do |t|
      t.integer :car_id
      t.integer :driver_id

      t.timestamps
    end
  end
end
