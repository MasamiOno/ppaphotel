class AddFrm06commentToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :frm06comment, :string
  end
end
