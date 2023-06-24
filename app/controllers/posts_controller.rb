class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:user_id])
    @users = User.find(params[:user_id])
  end

  def new
    @post_new = Post.new
    @user_new = current_user
    @like = Like.new
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @user = User.find(params[:id])
  end

  def create
    @user_new = current_user
    @post = Post.new(params.require(:post).permit(:Title, :Text))
    @post.author_id = @user_new.id
    if @post.save
      redirect_to @post, notice: 'post created successfully'
    else
      render :new
    end
  end
end
