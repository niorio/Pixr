class Addlikecount < ActiveRecord::Migration
  def change
    add_column :photos, :likes_count, :integer, default: 0
    Photo.find_each { |photo| Photo.reset_counters(photo.id, :likes) }
  end
end
