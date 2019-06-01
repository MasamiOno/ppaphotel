class AddFloornameToFloors < ActiveRecord::Migration[5.2]
  def change
    add_column :floors, :floorname, :string
    add_index :floors, :floorname, unique: true
  end
end
