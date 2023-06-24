class CommentsCountroller < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:comment).permit(:Text))
    if @comment.save
      redirect_to @post, notice: 'comment created successfuully'
    else
      render 'posts/show'
    end
  end
end
