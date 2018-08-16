class Question < ApplicationRecord
  belongs_to :user


  has_many :question_votes
  has_many :answers
  has_many :comments, through: :answers
  has_many :answer_votes, through: :answers
  has_many :comment_votes, through: :comments
end
