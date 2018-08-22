class AnswerVote < ApplicationRecord
  belongs_to :user
  belongs_to :answer



  def user_name
    self.user.name
  end
end
