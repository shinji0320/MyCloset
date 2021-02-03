class Item < ApplicationRecord
  belongs_to :user
   attachment :image 
end
