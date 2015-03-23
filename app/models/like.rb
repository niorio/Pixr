class Like < ActiveRecord::Base
  validates :user, :photo, presence: true
  validates_uniqueness_of :user, scope: :photo, message: "cannot like something more than once"
  belongs_to :user
  belongs_to :photo, counter_cache: true

end
