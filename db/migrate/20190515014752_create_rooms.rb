class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :cutie_id

      t.timestamps
    end
  end
end
