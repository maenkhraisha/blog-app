class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :authorId
      t.integer :postId
      t.time :updatedAt
      t.time :updatedAt

      t.timestamps
    end
  end
end
