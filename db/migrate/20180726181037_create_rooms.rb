class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :color
      t.belongs_to :building, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
