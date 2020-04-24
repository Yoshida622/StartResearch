class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :money
      t.string :hour
      t.string :station
      t.string :location
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
