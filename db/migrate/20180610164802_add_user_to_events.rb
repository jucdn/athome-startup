class AddUserToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :user, index: true, foreign_key: true
  end
end
