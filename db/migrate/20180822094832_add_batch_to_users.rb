class AddBatchToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :batch, :string
  end
end
