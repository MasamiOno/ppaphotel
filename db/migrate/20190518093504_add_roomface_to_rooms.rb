class AddRoomfaceToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :roomface, :string
  end
end
