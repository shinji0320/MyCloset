class Genre < ApplicationRecord
  has_many :items
    # enum name: { "アウター":0, "トップス":1, "スカート":2, "ワンピース":3, "シューズ":4 }
end
