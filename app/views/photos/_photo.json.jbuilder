json.extract! photo, :id, :description, :longitude, :latitude, :created_at, :updated_at, :image
json.user do |json|
  json.extract! photo.user, :fid, :name
end