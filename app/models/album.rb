class Album < ActiveRecord::Base
  validates :owner_id, :title, presence: true

  belongs_to :owner, class_name: 'User'
  has_many :photos



end
