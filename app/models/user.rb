class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  
    def recent_three_post
      posts.limit(3).order(created_at: :desc)
    end
end
