class AddFrm04commentToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :frm04comment, :string
  end
end
