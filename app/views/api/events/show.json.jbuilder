json.status 200
json.errors []
json.data do
  json.id @event.id
  json.start_at @event.start_at.strftime('%Y/%m/%d %H:%M')
  json.end_at @event.end_at.strftime('%Y/%m/%d %H:%M')
  json.stage_name @event.stage.name
  json.stage_image_url @event.stage.image_url
  json.weapons do
    json.array! @event.weapons do |weapon|
      json.name weapon.name
      json.image_url weapon.image_url
    end
  end
end
