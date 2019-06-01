class AddFrame01ToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :frame01, :string
  end
end
