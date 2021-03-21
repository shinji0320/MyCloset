class Item < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :item_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :coordinete_tables, dependent: :destroy
  has_many :recommendations

  validates :name, presence: true, length: { in: 2..30 }
  validates :shop_name, presence: true, length: { maximum: 30 }
  validates :detail, presence: true, length: { maximum: 200 }
  validates :private, inclusion: { in: [true, false] }
  attachment :image
  
  scope :published, -> { where(private: true) }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search_for(content, method)
    if method == 'perfect'
      where(name: content)
    elsif method == 'forward'
      where('name LIKE ?', content + '%')
    elsif method == 'backward'
      where('name LIKE ?', '%' + content)
    else
      where('name LIKE ?', '%' + content + '%')
    end
  end
end
