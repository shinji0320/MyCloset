class CreateCoordinetes < ActiveRecord::Migration[5.2]
  def change
    create_table :coordinetes do |t|
      t.string :name

      t.timestamps
    end
  end
end
