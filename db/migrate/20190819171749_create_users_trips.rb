class CreateUsersTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :users_trips do |t|
      t.references :user, foreign_key: true
      t.references :trip, foreign_key: true
    end
  end
end
