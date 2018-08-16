class ChangeUserPointToPoints < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :point, :points
  end
end
