json.status 200
json.errors []
json.data do
  json.is_open @is_open
  if @is_open
    json.event do
      json.id @opening_event.id
      json.start_at l @opening_event.start_at, format: :short
      json.end_at l @opening_event.end_at, format: :short
      json.hours((@opening_event.end_at - @opening_event.start_at).seconds_to_hours)
      json.stage_name @opening_event.stage.name
      json.weapons do
        json.array! @opening_event.weapons do |weapon|
          json.name weapon.name
          json.count_text weapon.count_text
          json.since_last_event_time weapon.last_weapon_event.since_last_event_times
        end
      end
    end
  end
end
