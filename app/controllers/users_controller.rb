class UsersController < ApplicationController
  before_action :ensure_user, only: [:show, :edit, :update]

  def show
    if @user != current_user
      @items = @user.items.where(private: "true")
    else
      @items = @user.items
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id)
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
