json.extract! @photo, :title, :id, :owner_id, :album_id, :created_at, :updated_at
json.comments @photo.comments do |comment|
  json.extract! comment, :body, :created_at, :updated_at, :author_id
  json.set! :author_name, comment.author.username
end
