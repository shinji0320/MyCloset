class ItemComment < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :comment, presence: true, length: { in: 2..140 }
end
