json.array! @rooms do |room|
  json.id room.id
  json.title room.name
  json.eventColor room.color
end
