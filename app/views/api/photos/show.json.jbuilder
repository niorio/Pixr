json.extract! @photo, :title, :id, :owner_id, :album_id, :created_at, :updated_at, :description
json.url @photo.img.url
json.myphoto @photo.owner == current_user
json.comments @photo.comments do |comment|
  json.extract! comment, :body, :created_at, :updated_at, :author_id
  json.author_name comment.author.username
  json.time_ago time_ago_in_words(comment.created_at) + " ago"
  json.my_comment comment.author == current_user
end
