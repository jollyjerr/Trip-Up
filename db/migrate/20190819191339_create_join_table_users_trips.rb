class CreateJoinTableUsersTrips < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :trips do |t|
      t.index [:user_id, :trip_id]
      t.index [:trip_id, :user_id]
    end
  end
end
