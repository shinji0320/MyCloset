class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :item_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :coordinetes, dependent: :destroy
  has_many :recommendations
  # フォロー機能
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  validates :name, presence: true, uniqueness: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }
  attachment :profile_image
  
  def me?(user_id)
    id == user_id
  end

  def follow(other_user)
    unless self == other_user
      relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    followings.include?(other_user)
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
