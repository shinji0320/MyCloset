class Item < ApplicationRecord
  belongs_to :user
  has_many :item_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :genre
  validates :name, presence: true,  length: { in: 2..30 }
  validates :shop_name, presence: true, length: {maximum: 200}
	validates :detail, presence: true, length: {maximum: 200}
	validates :private, inclusion:{in: [true, false]}
 
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
   attachment :image 
end
