class AddRoomnumberToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :roomnumber, :integer
    add_index :rooms, :roomnumber, unique: true
  end
end
