class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :authorId
      t.string :title
      t.text :text
      t.time :updatedAt
      t.time :updatedAt
      t.integer :commentsCounter
      t.integer :likeCounter

      t.timestamps
    end
  end
end
