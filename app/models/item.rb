class Item < ApplicationRecord
  belongs_to :user
  has_many :item_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :genre
  has_many :coordinete_tables, dependent: :destroy
  validates :name, presence: true,  length: { in: 2..30 }
  validates :shop_name, presence: true, length: {maximum: 200}
	validates :detail, presence: true, length: {maximum: 200}
	validates :private, inclusion:{in: [true, false]}
  attachment :image


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Item.where(name: content)
    elsif method == 'forward'
      Item.where('name LIKE ?', content+'%')
    elsif method == 'backward'
      Item.where('name LIKE ?', '%'+content)
    else
      Item.where('name LIKE ?', '%'+content+'%')
    end
  end
end
