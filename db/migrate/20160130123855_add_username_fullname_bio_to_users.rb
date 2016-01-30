class AddUsernameFullnameBioToUsers < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string, null: false
    add_column :users, :username, :string, null: false, unique: true
    add_column :users, :bio, :text
  end
end
