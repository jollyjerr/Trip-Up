class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :link

      t.references :trip, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
