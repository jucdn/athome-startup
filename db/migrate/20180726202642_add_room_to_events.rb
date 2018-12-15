class AddRoomToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :room, index: true, foreign_key: true
  end
end
