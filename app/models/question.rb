class Question < ActiveRecord::Base
  belongs_to :user

  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  has_many :question_tags
  has_many :tags, through: :question_tags

  validates :title, :body, :user, presence: true
end
