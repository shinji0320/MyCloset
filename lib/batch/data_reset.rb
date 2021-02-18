class Batch::DataReset
  def self.data_reset
    Recommendation.destroy_all
    Item.where(private: "true").shuffle.take(3).each do |item|
      Recommendation.create(recommendation_params(item))
    end
    p "おすすめの商品"
  end

  def self.recommendation_params(item)
    {
      genre_id: item.genre_id,
      user_id: item.user_id,
      item_id: item.id,
    }
  end
end
