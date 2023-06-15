class ChangeDefaultValueOfRole < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :role_id, default: Role.first.id
  end
end
