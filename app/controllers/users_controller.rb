class UsersController < ApplicationController
  before_action :ensure_user, only: [:show, :edit, :update]

  def show
    if @user != current_user
      @items = Item.where(private: "true")
    else
      @items = @user.items
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def ensure_user
    @user = User.find(params[:id])
  end
end
