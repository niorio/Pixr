json.array! @photos do |photo|
  json.extract! photo, :title, :id, :owner_id, :album_id, :created_at, :updated_at
  json.thumb_url photo.img.url(:thumb)
  json.like_count photo.likes_count
end
