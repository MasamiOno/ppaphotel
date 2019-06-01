class AddRentnameToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :rentname, :string
    add_index :rooms, :rentname, unique: true
  end
end
