class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.integer :user_id
      t.string :name
      t.text :image_id
      t.string :shop_name
      t.text :detail
      t.boolean :private, default: false, null: false

      t.timestamps
    end
  end
end
