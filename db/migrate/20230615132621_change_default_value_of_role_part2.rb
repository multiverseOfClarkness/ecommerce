class ChangeDefaultValueOfRolePart2 < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :role_id, Role.first.id
  end
end
