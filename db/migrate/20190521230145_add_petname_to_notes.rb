class AddPetnameToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :petname, :string
  end
end
