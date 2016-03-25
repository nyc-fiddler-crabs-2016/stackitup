class QuestionTag < ActiveRecord::Base
  belongs_to :question
  belongs_to :tag

  validates :question, :tag, presence: true
end
