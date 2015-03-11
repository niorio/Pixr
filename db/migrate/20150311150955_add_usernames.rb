class AddUsernames < ActiveRecord::Migration
  def change
    add_column(:users, :username, :string, null: false)
  end
end
