class Photo < ActiveRecord::Base
  validates :owner_id, :title, presence: true

  has_attached_file :img, styles: { thumb: "400x325", full: "900x700"}
  validates_attachment_content_type :img, :content_type => /\Aimage\/.*\Z/
  validates_attachment :img, presence: true, size: {in: 0..10.megabytes}

  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  belongs_to :album
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  scope :sharable, -> { where(private: false) }

  def allowed?(user)
    if owner === user || (user.follows?(owner) && !(self.private))
      return true
    else
      return false
    end
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
