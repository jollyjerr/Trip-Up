class AddDatesToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :date, :datetime
  end
end
