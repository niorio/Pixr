class Tag < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :taggings
  has_many :photos, through: :taggings


end
