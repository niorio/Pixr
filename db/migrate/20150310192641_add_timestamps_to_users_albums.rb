class AddTimestampsToUsersAlbums < ActiveRecord::Migration
  def change
    add_column(:users, :created_at, :datetime)
    add_column(:users, :updated_at, :datetime)
    add_column(:albums, :created_at, :datetime)
    add_column(:albums, :updated_at, :datetime)
  end
end
