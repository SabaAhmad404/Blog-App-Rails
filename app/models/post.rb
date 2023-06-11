class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  def recent_comments
    Comment.order(CreatedAt: :desc).limit(5)
  end
  after_save :update_posts_like_counter

  private

  def update_posts_like_counter
    author.increment!(:PostsCounter)
  end
end
