class Question < ApplicationRecord
  belongs_to :user

  has_many :question_votes
  has_many :answers
  has_many :comments, through: :answers
  has_many :answer_votes, through: :answers
  has_many :comment_votes, through: :comments

  include PgSearch

  pg_search_scope :search_by_subcategory_and_category,
                  against: [:subcategory, :category, :title, :content],
                  associated_against: {
                    user: [:name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
