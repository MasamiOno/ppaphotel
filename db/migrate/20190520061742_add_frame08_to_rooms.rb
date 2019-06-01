class AddFrame08ToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :frame08, :string
  end
end
