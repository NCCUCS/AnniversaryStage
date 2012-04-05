json.extract! photo, :id, :description, :created_at, :updated_at, :image
json.user do |json|
  json.extract! photo.user, :fid, :name
end