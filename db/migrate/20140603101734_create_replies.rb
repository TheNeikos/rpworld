class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :place_id
      t.integer :user_id
      t.integer :character_id
      t.string :body

      t.timestamps
    end
  end
end
