class IcalController < ActionController::Base
  def show
    @room = Room.find_by(hid: params[:id])
    @events = Event.joins(room: :building).where("rooms.hid = ?", params[:id])
    
    respond_to do |format|
      format.ics do
        cal = Icalendar::Calendar.new
        cal.x_wr_calname = "#{@room.name} - #{@room.building.name}"
        @events.each do |event|
          cal.event do |e|
            e.dtstart     = event.start_at
            e.dtend       = event.end_at
            e.summary     = event.title
            e.description = ''
          end
        end
        cal.publish
        render plain: cal.to_ical
      end
    end
    
  end
end
