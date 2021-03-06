class User < ActiveRecord::Base
  include PgSearch

  validates :email, :password_digest, :session_token, :username, presence: true
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :password, confirmation: true
  after_initialize :ensure_session_token
  attr_reader :password

  pg_search_scope :full_search,
                  against: [:username, :email],
                  using: { tsearch: { prefix: true } }

  has_many :photos, foreign_key: :owner_id, dependent: :destroy
  has_many :albums, foreign_key: :owner_id, dependent: :destroy
  has_many :comments, foreign_key: :author_id, dependent: :destroy
  has_many :likes
  has_many :liked_photos, through: :likes, source: :photo

  has_many :in_follows, class_name: "Follow", foreign_key: "followee_id"
  has_many :out_follows, class_name: "Follow", foreign_key: "follower_id"
  has_many :followers, through: :in_follows, source: :follower
  has_many :followees, through: :out_follows, source: :followee
  has_many :followee_photos, through: :followees, source: :photos

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user
    user.valid_password?(password) ? user : nil
  end

  def self.find_or_create_by_auth_hash(auth_hash)
    user = User.find_by(
            provider: auth_hash[:provider],
            uid: auth_hash[:uid])

    unless user
      user = User.new(
            username: auth_hash[:info][:nickname],
            provider: auth_hash[:provider],
            uid: auth_hash[:uid],
            password: SecureRandom::urlsafe_base64)
    end

    user
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def ensure_session_token
    self.session_token = SecureRandom.urlsafe_base64(16)
  end

  def reset_token
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save
    self.session_token
  end

  def valid_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def likes?(photo)
    self.likes.where(photo: photo).exists?
  end

  def follows?(user)
    self.followees.include?(user)
  end

  def followed_photos
    self.followee_photos.sharable
  end

end
