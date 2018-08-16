class CreateQuestionVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :question_votes do |t|
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
