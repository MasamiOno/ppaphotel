class AddFrm01commentToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :frm01comment, :string
  end
end
