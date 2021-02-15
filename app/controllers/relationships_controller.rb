class RelationshipsController < ApplicationController
  before_action :ensure_user, only: [:create, :destroy, :followings, :followers]
  
  def create
    following = current_user.follow(@user)
    following.save
    flash[:success] = "フォローしました"
  end

  def destroy
    following = current_user.unfollow(@user)
    following.destroy
    flash[:success] = "フォローを解除しました"
  end

  def followings
    @users = @user.followings
  end

  def followers
    @users = @user.followers
  end
  
  private

  def ensure_user
    @user = User.find(params[:user_id])
  end
end
