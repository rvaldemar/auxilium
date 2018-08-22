class AddNumberOfQuestionsToBatchStats < ActiveRecord::Migration[5.2]
  def change
    add_column :batch_stats, :number_of_questions, :integer
  end
end
