class AddAuthorToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :author_id, :integer
  end
end
