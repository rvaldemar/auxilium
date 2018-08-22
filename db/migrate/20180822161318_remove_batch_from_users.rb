class RemoveBatchFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :batch, :string
  end
end
