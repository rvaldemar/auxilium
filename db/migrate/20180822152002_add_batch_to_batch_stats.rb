class AddBatchToBatchStats < ActiveRecord::Migration[5.2]
  def change
    add_column :batch_stats, :batch, :string
  end
end
