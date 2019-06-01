class AddFrame10ToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :frame10, :string
  end
end
