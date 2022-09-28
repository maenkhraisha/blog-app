require 'rails_helper'

RSpec.describe 'posts/show', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Nati', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'I am a software Engineer', posts_counter: 0)
    @first_post = Post.create(author: @first_user, title: 'post1', text: 'my', comments_counter: 0, likes_counter: 0)

    visit user_post_path(@first_user.id, @first_post.id)
  end

  describe 'post show page' do
    it 'I can see the post title' do
      expect(page).to have_content @first_post.title
    end
    it 'I can see who wrote the post.' do
      expect(page).to have_content @first_user.name
    end
    it 'I can see how many comments it has.' do
      expect(page).to have_content('Comments No')
    end
    it 'I can see how many likes it has' do
      expect(page).to have_content('Likes No')
    end
    it 'I can see the post body' do
      expect(page).to have_content @first_post.text
    end
    it 'I can see the username of each commentor' do
      expect(page).to have_content('comments list')
    end
    it 'I can see the comment each commentor left' do
      expect(page).to have_content('comments list')
    end
  end
end
