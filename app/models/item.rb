class Item < ApplicationRecord
  belongs_to :user
  has_many :item_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :genre
 
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
   attachment :image 
end
