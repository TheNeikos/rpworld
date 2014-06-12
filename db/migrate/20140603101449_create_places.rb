class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.integer :region_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
