class Photo < ActiveRecord::Base
  validates :owner_id, :title, presence: true

  belongs_to :owner, class_name: 'User', foreign_key: :owner_id

  def allowed?(user)
    #user is owner, photo is public, or owner is sharing with user
    true
  end

end
