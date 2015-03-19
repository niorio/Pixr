json.extract! user, :id, :email, :username
json.following current_user.follows?(user)
json.me current_user == user
