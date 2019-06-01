class AddFrame09ToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :frame09, :string
  end
end
