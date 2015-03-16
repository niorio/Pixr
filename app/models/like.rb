class Like < ActiveRecord::Base
  validates :user, :photo, presence: true
  validate :unique_like
  belongs_to :user
  belongs_to :photo
  
  private
  def unique_like
    if Like.where(user_id: user_id, photo_id: photo_id).exists?
      errors.add(:user, "cannot like something multiple times")
    end
  end
end