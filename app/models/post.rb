class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  after_save :update_user_posts_count

  def update_user_posts_count
    author.increment!(:posts_counter)
  end

  private
  
  def recent_five_comments
    comments.last(5)
  end
end
