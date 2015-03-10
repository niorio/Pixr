class User < ActiveRecord::Base
  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  after_initialize :ensure_session_token
  attr_reader :password

  has_many :photos, foreign_key: :owner_id
  has_many :albums, foreign_key: :owner_id

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil unless user
    user.valid_password?(password) ? user : nil
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


end
