class Follow < ActiveRecord::Base
  validates_uniqueness_of :followee, scope: :follower, message: "cannot follow someone more than once"
  belongs_to :follower, class_name: 'User', foreign_key: :follower_id
  belongs_to :followee, class_name: 'User', foreign_key: :followee_id
end
