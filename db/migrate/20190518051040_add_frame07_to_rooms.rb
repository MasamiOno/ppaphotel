class AddFrame07ToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :frame07, :string
  end
end
