class CreateRecommendations < ActiveRecord::Migration[5.2]
  def change
    create_table :recommendations do |t|
      t.integer :genre_id
      t.integer  :user_id
      t.integer  :item_id

      t.timestamps
    end
  end
end
