class AddFrame06ToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :frame06, :string
  end
end
