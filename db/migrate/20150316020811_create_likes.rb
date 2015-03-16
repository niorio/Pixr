class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :photo_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
    add_index :likes, :photo_id
    add_index :likes, :user_id
    add_index :comments, :photo_id
  end
end
