require 'rails_helper'

RSpec.describe "users/index", type: :feature do
  before(:each) do
    @user1 = User.create(name: 'Nati', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'I am a software Engineer', posts_counter: 0)
    visit root_path
  end
  describe 'Testing User/index' do
    it 'shows the user name' do
      expect(page).to have_content('Nati')
    end
    it 'shows the number of posts' do
      expect(page).to have_content('Number of posts')
    end
    it 'shows the user profile picture' do
      expect(page).to have_css('img')
    end
    it 'Redirects to user show page' do
      find('#profile-img').click
      expect(page).to have_content('Nati')
    end
  end
end
