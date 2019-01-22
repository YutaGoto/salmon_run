json.status 200
json.errors []
json.data do
  json.array! @events do |event|
    json.id event.id
    json.start_at l event.start_at, format: :short
    json.end_at l event.end_at, format: :short
    json.hours((event.end_at - event.start_at).seconds_to_hours)
    json.stage do
      json.name event.stage.name
      json.show_url stage_path(event.stage)
    end
    json.show_url event_path(event)
    json.weapons do
      json.array! event.weapons do |weapon|
        json.name weapon.name
      end
    end
  end
end
