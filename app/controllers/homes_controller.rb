class HomesController < ApplicationController
  before_action :recommendations, only: [:top, :about]
  before_action :ranks, only: [:top]

  def top
  end

  def about
  end

  def new_guest
    user = User.find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
      user.prefecture = "沖縄県"
      user.introduction = "持っている服がすぐに確認できて服選びが快適!!コーディネートが作れて服選びが楽"
    end
    sign_in user
    redirect_to items_path, notice: "ゲストユーザーとしてログインしました。"
  end


  private

  def recommendations
    @recommendations = Recommendation.all
  end

  def ranks
    @all_favorite_ranks = Item.find(Favorite.group(:item_id).
                              order('count(item_id) desc').limit(3).pluck(:item_id))

    @all_comment_ranks = Item.find(ItemComment.group(:item_id).
                              order('count(item_id) desc').limit(3).pluck(:item_id))

    @all_genre_ranks = Item.find(Item.group(:genre_id).
                              order('count(genre_id) desc').limit(3).pluck(:genre_id))
  end
end
