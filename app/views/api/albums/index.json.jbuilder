json.array! @albums do |album|
  json.extract! album, :id, :title, :owner_id, :created_at, :updated_at
  json.preview_url album.photos.first.img.url(:thumb)
end
