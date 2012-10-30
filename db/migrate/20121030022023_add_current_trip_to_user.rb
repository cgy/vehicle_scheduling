class AddCurrentTripToUser < ActiveRecord::Migration
  def change
    add_column :users, :current_trip, :integer
  end
end
