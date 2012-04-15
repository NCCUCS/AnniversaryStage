json.array!(@photos) do |json, photo|
  json.partial! photo
end