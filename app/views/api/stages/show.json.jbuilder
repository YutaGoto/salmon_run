json.status 1
json.errors []
json.data do
  json.id @stage.id
  json.name @stage.name
  json.image_url @stage.image_url
end
json.weapons do
  json.array! @weapons do |weapon|
    json.name weapon.name
    json.image_url weapon.image_url
    json.count @stage.weapon_count(weapon.id)
  end
end
