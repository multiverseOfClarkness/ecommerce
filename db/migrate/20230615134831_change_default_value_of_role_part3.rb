class ChangeDefaultValueOfRolePart3 < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :role_id, Role.second.id
  end
end
