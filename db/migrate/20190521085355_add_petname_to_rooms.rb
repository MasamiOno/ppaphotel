class AddPetnameToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :petname, :string
  end
end
