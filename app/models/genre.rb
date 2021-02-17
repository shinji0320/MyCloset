class Genre < ApplicationRecord
  has_many :items
  has_many :recommendations
    validates :name, presence: true, uniqueness: true
end
