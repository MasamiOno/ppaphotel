class AddRoomcounterToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :roomcounter, :integer , default:3
  end
end
