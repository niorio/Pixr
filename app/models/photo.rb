class Photo < ActiveRecord::Base
  validates :owner_id, :title, presence: true

  has_attached_file :img, styles: { thumb: "400x325", full: "850x1000"}
  validates_attachment_content_type :img, :content_type => /\Aimage\/.*\Z/
  validates_attachment :img, presence: true, size: {in: 0..20.megabytes}

  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  belongs_to :album
  has_many :comments

  def allowed?(user)
    #user is owner, photo is public, or owner is sharing with user
    return true if owner == user
  end

end
