class Coordinete < ApplicationRecord
  has_many :coordinete_tables, dependent: :destroy
  belongs_to :user
  validates :name, presence: true, length: { in: 2..20 }
end
