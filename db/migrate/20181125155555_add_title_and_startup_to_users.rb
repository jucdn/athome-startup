class AddTitleAndStartupToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :startup, foreign_key: true
    add_column :users, :title, :string
  end
end
