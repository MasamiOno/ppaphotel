class AddFrm07commentToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :frm07comment, :string
  end
end
