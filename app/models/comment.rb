class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_comments_counter
    Post.update(ComentsCounter: 1)
  end
end
