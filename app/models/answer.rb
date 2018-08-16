class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  has_many :comments
  has_many :answer_votes

  has_many :comment_votes, through: :comments
end
