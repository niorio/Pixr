class ChangePhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :filepicker_url
    add_column :photos, :description, :text
  end
end
