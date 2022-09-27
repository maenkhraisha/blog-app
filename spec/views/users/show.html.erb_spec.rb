require 'rails_helper'

RSpec.describe "users/show", type: :feature do
  before(:each) do    
    @first_user = User.create(name: 'Nati', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'I am a software Engineer', posts_counter: 0)
    @first_post = Post.create(author: @first_user, title: 'post1', text: 'my', comments_counter: 0, likes_counter: 0)
    @second_post = Post.create(author: @first_user, title: 'post2', text: 'name', comments_counter: 0, likes_counter: 0)
    @third_post = Post.create(author: @first_user, title: 'post3', text: 'maen', comments_counter: 0, likes_counter: 0)

    visit user_path(@first_user.id)
  end
  describe 'Testing User/show' do
    it 'I can see the user profile picture' do
      expect(page).to have_css('img')
    end
    it 'I can see the user username' do
      expect(page).to have_content('Nati')
    end
    it 'I can see the number of posts the user has written' do
        expect(page).to have_content('Number of posts')
    end
    it 'I can see the user bio' do
        expect(page).to have_content('Bio')
    end
    it 'I can see the user first 3 posts' do
      expect(page).to have_content @first_post.title
      expect(page).to have_content @second_post.title
      expect(page).to have_content @third_post.title
    end
    it 'I can see a button that lets me view all of a user posts.' do
      expect(page).to have_link 'See all posts'
    end
    it 'When I click a user post, it redirects me to that post show page' do
      click_link 'post1'
      expect(page).to have_current_path user_post_path(@first_user, @first_post)
    end
    it 'When I click to see all posts, it redirects me to the user posts index page' do
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@first_user)
    end
  end
end
