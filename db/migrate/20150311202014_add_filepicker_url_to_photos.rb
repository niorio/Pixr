class AddFilepickerUrlToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :filepicker_url, :string
  end
end
