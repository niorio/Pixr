json.extract! @photo, :title, :id, :album_id, :created_at, :updated_at, :description
json.url @photo.img.url(:full)
json.myphoto @photo.owner == current_user
json.comments @photo.comments do |comment|
  json.partial! 'api/comments/comment', comment: comment
end
json.like_count @photo.like_count
json.liked @photo.liked_by?(current_user)
json.tags @photo.tags do |tag|
  json.name tag.name
  json.id tag.id
end
json.owner do
  json.partial! 'api/users/user', user: @photo.owner
end
json.thumb_url @photo.img.url(:thumb)
