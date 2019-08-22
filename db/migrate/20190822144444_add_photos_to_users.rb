class AddPhotosToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :photo, :string, default: "https://www.sccpre.cat/mypng/detail/105-1056428_buncee-evergreen-christmas-tree.png"
  end
end
