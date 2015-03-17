class Tagging < ActiveRecord::Base
    validates :tag, :photo, presence: true
    belongs_to :tag
    belongs_to :photo

end
