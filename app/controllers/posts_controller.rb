class PostsController < ApplicationController
  def index
    @posts=Post.where(author_id: params[:user_id])
    @users=User.find(params[:user_id])
  end

  def new
  @post_new=Post.new
  end

  def show
    @post=Post.find(params[:id])
    @comments=@post.comments
    @user=User.find(params[:id])

  end
end
