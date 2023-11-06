class CreateAlerts < ActiveRecord::Migration[5.2]
  def change
    create_table :alerts do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.string :petname

      t.timestamps
    end
  end
end
