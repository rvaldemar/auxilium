class AddVoteToAnswerVotes < ActiveRecord::Migration[5.2]
  def change
    add_column :answer_votes, :vote, :integer
  end
end
