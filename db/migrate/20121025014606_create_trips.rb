class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :car_id
      t.integer :user_id
      t.integer :destination_id
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
