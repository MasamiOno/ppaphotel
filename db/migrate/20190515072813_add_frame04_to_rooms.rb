class AddFrame04ToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :frame04, :string
  end
end
