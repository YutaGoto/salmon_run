json.status 1
json.errors []
json.data do
  json.array! @events do |event|
    json.id event.id
    json.start_at event.end_at.strftime('%Y/%m/%d %H:%M')
    json.end_at event.end_at.strftime('%Y/%m/%d %H:%M')
    json.stage_name event.stage.name
    json.weapons do
      json.array! event.weapons do |weapon|
        json.name weapon.name
      end
    end
  end
end
