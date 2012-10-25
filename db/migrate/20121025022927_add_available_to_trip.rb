class AddAvailableToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :available, :boolean
  end
end
