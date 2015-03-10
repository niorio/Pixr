class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :owner_id, null: false
      t.string :title, null: false
    end
    add_index :albums, :owner_id
    add_column :photos, :album_id, :integer
    add_index :photos, :album_id
  end
end
