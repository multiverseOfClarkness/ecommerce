class RenameRoleInUsersToRoleId < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :role, :role_id
  end
end
