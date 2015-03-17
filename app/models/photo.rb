class Photo < ActiveRecord::Base
  validates :owner_id, :title, presence: true

  has_attached_file :img, styles: { thumb: "400x325", full: "900x700"}
  validates_attachment_content_type :img, :content_type => /\Aimage\/.*\Z/
  validates_attachment :img, presence: true, size: {in: 0..10.megabytes}

  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  belongs_to :album
  has_many :comments
  has_many :likes
  has_many :taggings
  has_many :tags, through: :taggings

  def allowed?(user)
    #user is owner, photo is public, or owner is sharing with user
    return true if owner == user
  end

  def liked_by?(user)
    self.likes.where(user: user).exists?
  end

  def like_count
    self.likes.count
  end


  def parse_tags(string)
    tagnames = string.split(",").map(&:strip)
    _tags = tagnames.map do |tagname|
      Tag.where(name: tagname).first_or_create
    end

    self.tags = _tags
  end

end
