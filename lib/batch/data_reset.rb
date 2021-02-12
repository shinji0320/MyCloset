class Batch::DataReset
  def self.data_reset
    User.delete_all
    Item.delete_all
    p "ユーザー・商品を全て削除しました"
  end
end