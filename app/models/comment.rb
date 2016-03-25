class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :body, :user, presence: true

  def writer
    self.user.username
  end
end
