class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  def update_posts_like_counter
    User.update(PostsCounter: 1)
  end

  def recent_comments
    Comments.order(CreatedAt: :desc).limit(5)
  end
end
