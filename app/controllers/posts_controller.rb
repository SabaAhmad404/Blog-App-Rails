class PostsController < ApplicationController
  def index
    @user = Post.find(params[:user_id])
    @posts = @user.posts
  end

  def new; end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end
end
