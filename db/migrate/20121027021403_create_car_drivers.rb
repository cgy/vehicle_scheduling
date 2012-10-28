class CreateCarDrivers < ActiveRecord::Migration
  def change
    create_table :car_drivers do |t|
      t.integer :car_id
      t.integer :driver_id
      t.boolean :available

      t.timestamps
    end
  end
end
