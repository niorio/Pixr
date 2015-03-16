json.extract! @photo, :title, :id, :owner_id, :album_id, :created_at, :updated_at, :description
json.url @photo.img.url(:full)
json.myphoto @photo.owner == current_user
json.comments @photo.comments do |comment|
  json.partial! 'api/comments/comment', comment: comment
end
json.like_count @photo.like_count
json.liked @photo.liked_by?(current_user)
