class Like < ActiveRecord::Base
  validates :user, :photo, presence: true
  validates_uniqueness_of :user_id, scope: :photo_id
  belongs_to :user
  belongs_to :photo
  
end