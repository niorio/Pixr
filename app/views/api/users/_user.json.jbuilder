json.extract! user, :id, :email, :username
json.following current_user.follows?(user)
