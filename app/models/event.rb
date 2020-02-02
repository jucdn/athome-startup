class Event < ActiveRecord::Base
  validates :title, presence: true
  attr_accessor :date_range
  belongs_to :user
  belongs_to :room
  
  before_save :queue_reminder
  after_destroy :cancel_reminder, if: :reminder_job_id?

  def queue_reminder
    cancel_reminder if reminder_job_id
    self.reminder_job_id = self.delay_until(self.start_at.asctime.in_time_zone("CET") - 1.minute).event_reminder
  end

  def cancel_reminder
    Sidekiq::Status.cancel reminder_job_id
  end
  

  def all_day_event?
    self.start_at == self.start_at.midnight && self.end_at == self.end_at.midnight ? true : false
  end
  
  def event_reminder
    SlackBot.new(self.user.uid.split('-')[0]).message("Hello, tu as réservé la salle #{self.room.name} pour #{self.title}.\nSi tu ne l'utiles pas, pense à annuler la réservation ici : <https://#{ENV['DOMAIN_NAME']}|annuler>").deliver
  end
end
