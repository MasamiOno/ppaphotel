class AddOwnernameToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :ownername, :string
  end
end
