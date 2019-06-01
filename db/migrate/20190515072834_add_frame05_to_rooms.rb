class AddFrame05ToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :frame05, :string
  end
end
