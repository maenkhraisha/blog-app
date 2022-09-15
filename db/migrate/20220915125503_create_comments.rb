class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :authorId
      t.integer :postId
      t.text :text
      t.time :updatedAt
      t.time :createdAt

      t.timestamps
    end
  end
end
