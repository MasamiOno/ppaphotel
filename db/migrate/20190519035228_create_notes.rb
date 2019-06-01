class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.references :user
      t.references :room
      t.string :comment
      t.timestamps
    end
  end
end
