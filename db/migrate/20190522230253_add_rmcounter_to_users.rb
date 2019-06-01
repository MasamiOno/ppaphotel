class AddRmcounterToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :rmcounter, :integer , default:3
  end
end
