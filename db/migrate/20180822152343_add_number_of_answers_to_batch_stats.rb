class AddNumberOfAnswersToBatchStats < ActiveRecord::Migration[5.2]
  def change
    add_column :batch_stats, :number_of_answers, :integer
  end
end
