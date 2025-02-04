class Post < ApplicationRecord
  belongs_to :subreddit
  belongs_to :user
  has_many :comments, dependent: :destroy
  # has_many :votes, dependent: :destroy

  validates :title, presence: true
  # validates :subreddit, presence: true
  validates :user, presence: true

  def upvote
    self.votes_count += 1
    self.save
  end
  
  def downvote
    self.votes_count -= 1
    self.save
  end
end
