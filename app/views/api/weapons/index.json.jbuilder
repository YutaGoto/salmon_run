json.status 1
json.errors []
json.data do
  json.array! @weapons do |weapon|
    json.id weapon.id
    json.name weapon.name
  end
end
