json.extract! @album, :title, :owner_id, :created_at, :updated_at

json.photos @album.photos do |photo|
  json.extract! photo, :id, :title, :owner_id, :created_at, :updated_at
  json.thumb_url photo.img.url(:thumb)
end
