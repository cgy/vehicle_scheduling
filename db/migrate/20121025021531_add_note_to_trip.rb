class AddNoteToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :note, :string
  end
end
