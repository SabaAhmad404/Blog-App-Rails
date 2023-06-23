class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @users_new = User.new
  end

  def show
    @user = User.find(params[:id])
  end
end
