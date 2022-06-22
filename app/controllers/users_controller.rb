# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.order_id.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings.order_id.page(params[:page])
  end

  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers.order_id.page(params[:page])
  end
end
