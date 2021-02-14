class Batch::DataReset
  def self.data_reset
    Recommendation.destroy_all
    Item.all.shuffle.take(3).each do |item|
      Recommendation.create(recommendation_params(item))
    end
    p "おすすめの商品"

  end

  def self.recommendation_params(item)
    {
      genre_id: item.genre_id,
      user_id: item.user_id,
      item_id: item.id
    }
  end
end


# ItemController#index の example
# def index
#     items = Item.where(private: "false")
# end
#
# def displayable
#     item = Item.find(params[:id])
#     item.private = 'false'
#     item.save!
# end

#
# 1. Recommendationモデルをmigrate
# 2. このbatchでItemモデルからおすすめの件を取得し, Recommendationにコピ-(create)
# 3. Application側でRecommendationController#index を実装し一覧を表示する