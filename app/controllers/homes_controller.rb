class HomesController < ApplicationController
  def top
  end

  def about
  end

  def new_guest
   user = User.find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
      user.introduction = "Closetの中がスマホでも見れて使いやすいコーディネートも登録できるなんて便利服選ぶ手間がかからないわ！"
   end
   sign_in user
   redirect_to items_path, notice: "ゲストユーザーとしてログインしました。"
  end
end
