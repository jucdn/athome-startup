class AddHidToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :hid, :string
  end
end
