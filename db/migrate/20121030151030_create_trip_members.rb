class CreateTripMembers < ActiveRecord::Migration
  def change
    create_table :trip_members do |t|
      t.integer :trip_id
      t.integer :member_id

      t.timestamps
    end
  end
end
