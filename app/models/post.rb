class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  validates :Title, presence: true, length: { maximum: 250 }
  validates :ComentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :LikesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    Comment.order(CreatedAt: :desc).limit(5)
  end
  after_save :update_posts_counter

  private

  def update_posts_counter
    author.increment!(:PostsCounter)
  end
end
