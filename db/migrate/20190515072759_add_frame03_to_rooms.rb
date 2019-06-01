class AddFrame03ToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :frame03, :string
  end
end
