class Question < ActiveRecord::Base
  attr_accessor :tag_string, :tag_list

  belongs_to :user

  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  has_many :question_tags
  has_many :tags, through: :question_tags

  validates :title, :body, :user, presence: true

  def set_tags(tag_string)
    tag_string.split(",").each do |tag|
      tag.downcase.chomp.strip
      self.tags << Tag.find_or_create_by(name: tag)
    end
  end

  def tag_string
    @tag_string
  end


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
