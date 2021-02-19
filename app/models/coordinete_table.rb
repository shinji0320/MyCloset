class CoordineteTable < ApplicationRecord
  belongs_to :item
  belongs_to :coordinete
  validates :item_id, presence: true
  validates :coordinete_id, presence: true
end
