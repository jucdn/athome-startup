class AddSocialNetworksToStartup < ActiveRecord::Migration[5.2]
  def change
    add_column :startups, :facebook, :string
    add_column :startups, :instagram, :string
    add_column :startups, :twitter, :string
  end
end
