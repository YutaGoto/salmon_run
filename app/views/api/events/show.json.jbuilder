json.status 200
json.errors []
json.data do
  json.id @event.id
  json.start_at l @event.start_at, format: :short
  json.end_at l @event.end_at, format: :short
  json.stage_name @event.stage.name
  json.stage_image_url @event.stage.image_url
  json.weapons do
    json.array! @event.weapons do |weapon|
      json.name weapon.name
      json.image_url weapon.image_url
    end
  end
end
