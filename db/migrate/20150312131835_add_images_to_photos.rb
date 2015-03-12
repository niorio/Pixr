class AddImagesToPhotos < ActiveRecord::Migration
  def self.up
    add_attachment :photos, :img
  end

  def self.down
    remove_attachment :photos, :img
  end

end
