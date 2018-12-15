json.array! @events do |event|
  date_format = event.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'
  json.id event.id
  json.title event.title + " - @" + event.user.nickname
  json.start event.start_at.strftime(date_format)
  json.end event.end_at.strftime(date_format)
  json.color event.room.color unless event.room.color.blank?
  json.room_id event.room.id
  json.allDay event.all_day_event? ? true : false
  json.update_url event_path(event, method: :patch)
  json.edit_url edit_event_path(event, building: event.room.building.id)
end
