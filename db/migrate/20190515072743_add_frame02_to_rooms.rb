class AddFrame02ToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :frame02, :string
  end
end
