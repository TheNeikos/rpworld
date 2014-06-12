class CreateMoods < ActiveRecord::Migration
  def change
    create_table :moods do |t|
      t.integer :character_id
      t.string :name
      t.string :description
      t.attachment :picture

      t.timestamps
    end
  end
end
