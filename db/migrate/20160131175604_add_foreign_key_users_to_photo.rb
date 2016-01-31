class AddForeignKeyUsersToPhoto < ActiveRecord::Migration
  def change
    add_foreign_key :photos, :users, name: "fk_users_photo"
  end
end
