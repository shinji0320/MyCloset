class Coordinete < ApplicationRecord
  has_many :coordinete_tables, dependent: :destroy
  belongs_to :user
end
