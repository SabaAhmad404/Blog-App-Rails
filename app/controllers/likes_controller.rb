class LikesCountroller < ApplicationController
  def new
    @like = Like.new
    @post = Post.find(params[:post_id])
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @likes = Like.new(user_id: @user.id, post_id: @post)
    if @likes.save
      redirect_to @posts, notice: 'liked post successfully'
    else
      redirect_to @post, alert: 'something went wrong'
    end
  end
end
