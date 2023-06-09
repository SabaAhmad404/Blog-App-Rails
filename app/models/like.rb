class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  def update_likes_counter
    Post.update(LikesCounter: 1)
  end
end
