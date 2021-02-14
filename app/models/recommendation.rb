class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :genre
end
