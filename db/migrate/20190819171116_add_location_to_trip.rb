class AddLocationToTrip < ActiveRecord::Migration[5.2]
  def change
    add_reference :trips, :location, foreign_key: true
    add_reference :trips, :category, foreign_key: true
  end
end
