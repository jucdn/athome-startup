class AddDetailsToStartups < ActiveRecord::Migration[5.2]
  def change
    add_column :startups, :website, :string
    add_column :startups, :tagline, :string
    add_column :startups, :description, :string
  end
end
