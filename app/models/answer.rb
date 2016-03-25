class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  has_many :votes, as: :voteable
  has_many :comments, as: :commentable


  validates :body, :user, :question, presence: true


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
