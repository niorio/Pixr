class AddIndexes < ActiveRecord::Migration
  def change
    add_index :follows, :follower_id
    add_index :follows, :followee_id
  end
end
