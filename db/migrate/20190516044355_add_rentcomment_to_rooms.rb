class AddRentcommentToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :rentcomment, :string
  end
end
