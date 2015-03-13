json.array! @albums do |album|
  json.extract! album, :id, :title, :owner_id, :created_at, :updated_at
  if album.photos.any?
    json.preview_url album.photos.first.img.url(:thumb)
  end
end
