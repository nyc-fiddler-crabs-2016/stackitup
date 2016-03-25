class Question < ActiveRecord::Base
  belongs_to :user

  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  has_many :question_tags
  has_many :tags, through: :question_tags

  validates :title, :body, :user, presence: true


  def write_vote_count
    self.votes.map {|vote| vote.value}.reduce(:+).to_s
  end

  def write_comment_count
    self.comments.count.to_s
  end

  def write_user_name
    self.user.username
  end

  def write_date
    Kronic.format(self.created_at)
  end

  def is_owned_by(current_user)
    current_user == self.user
  end

end
