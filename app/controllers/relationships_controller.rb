class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    following = current_user.follow(@user)
    following.save
    flash[:success] = 'フォローしました'

  end

  def destroy
    @user = User.find(params[:user_id])
    following = current_user.unfollow(@user)
    following.destroy
    flash[:success] = 'フォローを解除しました'
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
end
