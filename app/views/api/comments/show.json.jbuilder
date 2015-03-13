json.extract! @comment, :id, :body, :created_at, :updated_at, :author_id
json.author_name @comment.author.username
json.time_ago time_ago_in_words(@comment.created_at) + " ago"
json.my_comment @comment.author == current_user
