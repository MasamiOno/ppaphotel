class AddFrm05commentToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :frm05comment, :string
  end
end
