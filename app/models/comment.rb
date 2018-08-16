class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :answer

  has_many :comment_votes
end
