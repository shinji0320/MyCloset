class CreateCoordineteTables < ActiveRecord::Migration[5.2]
  def change
    create_table :coordinete_tables do |t|
      t.integer :item_id
      t.integer :coordinete_id

      t.timestamps
    end
  end
end
