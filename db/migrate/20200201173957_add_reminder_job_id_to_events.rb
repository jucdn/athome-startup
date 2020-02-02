class AddReminderJobIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :reminder_job_id, :string
  end
end
