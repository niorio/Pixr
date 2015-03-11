class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :author_id, null: false
      t.integer :photo_id, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
