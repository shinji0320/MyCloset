class Genre < ApplicationRecord
  has_many :items
    # enum name: { "アウター":0, "トップス":1, "ボトムス":2, "スカート":3, "ワンピース":4, "シューズ":5 }
    validates :name, presence: true, uniqueness: true
end
