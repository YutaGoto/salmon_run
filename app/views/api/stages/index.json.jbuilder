json.status 1
json.errors []
json.data do
  json.array! @stages do |stage|
    json.id stage.id
    json.name stage.name
  end
end
