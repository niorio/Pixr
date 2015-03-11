class Comment < ActiveRecord::Base
  validates :author_id, :photo_id, :body, presence: true

  belongs_to :author, class_name: 'User'
  belongs_to :photo

end
