class AddFrm03commentToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :frm03comment, :string
  end
end
