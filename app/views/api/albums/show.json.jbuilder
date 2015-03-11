json.extract! @album, :title, :owner_id, :created_at, :updated_at

json.photos @album.photos do |photo|
  json.extract! photo, :title, :owner_id, :created_at, :updated_at
end