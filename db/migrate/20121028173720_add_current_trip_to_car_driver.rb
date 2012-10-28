class AddCurrentTripToCarDriver < ActiveRecord::Migration
  def change
    add_column :car_drivers, :current_trip, :integer, default:0
  end
end
