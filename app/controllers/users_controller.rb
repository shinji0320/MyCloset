class UsersController < ApplicationController
  before_action :ensure_user, only: [:show, :edit, :update]

  def show
    if !@user.me?(current_user)
      @items = @user.items.published
    else
      @items = @user.items
    end
  end

  def edit
    if !@user.me?(current_user)
      redirect_to user_path(current_user)
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: '変更しました。'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :prefecture)
  end

  def ensure_user
    @user = User.find(params[:id])
  end
end
