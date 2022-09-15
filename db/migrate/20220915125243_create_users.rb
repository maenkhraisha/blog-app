class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.text :image
      t.text :bio
      t.time :updateAt
      t.time :createAt
      t.integer :postsCounter

      t.timestamps
    end
  end
end
