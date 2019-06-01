class AddFrm02commentToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :frm02comment, :string
  end
end
