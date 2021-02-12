class Coordinete < ApplicationRecord
  has_many :coordinete_tables, dependent: :destroy
end
