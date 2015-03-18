class Privacy < ActiveRecord::Migration
  def change
    add_column :photos, :private, :boolean
    Photo.update_all(private: false)
  end
end
