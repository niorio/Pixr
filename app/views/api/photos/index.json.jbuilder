json.array! @photos do |photo|
  json.extract! photo, :title, :id, :owner_id, :album_id, :created_at, :updated_at
  json.set! :url, photo.img.url
end
