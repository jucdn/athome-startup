class CreatePerks < ActiveRecord::Migration[6.0]
  def change
    create_table :perks do |t|
      t.string :name
      t.text :description
      t.text :offer
      t.string :url

      t.timestamps
    end
  end
end
