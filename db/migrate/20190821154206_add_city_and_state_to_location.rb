class AddCityAndStateToLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :city, :string
    add_column :locations, :state, :string
    add_column :locations, :longitude, :float
    add_column :locations, :latitude, :float
  end
end
