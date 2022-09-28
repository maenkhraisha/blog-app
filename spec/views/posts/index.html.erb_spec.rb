require 'rails_helper'

RSpec.describe 'posts/index', type: :feature do
  before (:each) do
    @first_user = User.create(name: 'Nati', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'I am a software Engineer', posts_counter: 0)
    @first_post = Post.create(author: @first_user, title: 'post1', text: 'my', comments_counter: 0, likes_counter: 0)
    @second_post = Post.create(author: @first_user, title: 'post2', text: 'name', comments_counter: 0, likes_counter: 0)
    @third_post = Post.create(author: @first_user, title: 'post3', text: 'maen', comments_counter: 0, likes_counter: 0)

    @first_comment = Comment.create(author: @first_user, post: @first_post, text:'this post is good')

    visit user_posts_path(@first_user.id)
  end
  describe 'Posts index page' do
    it 'I can see the user profile picture' do
      expect(page).to have_css('img')
  end
  it 'I can see the user username' do
      expect(page).to have_content('Nati')
  end
  it "I can see the number of posts the user has written" do
    expect(page).to have_content @first_post.title
    expect(page).to have_content @second_post.title
    expect(page).to have_content @third_post.title
  end
      it "I can see a posts title" do
      expect(page).to have_content 'post1'
      expect(page).to have_content 'post2'
      expect(page).to have_content 'post3'
    end
    it 'I can see some of the post body' do
      expect(page).to have_content('my')
    end
    it 'I can see the first comments on a post' do
      expect(page).to have_content 'Nati : this post is good'
    end
    it 'I can see how many comments a post has' do
      expect(page).to have_content('Comments No')
    end
    it 'I can see how many likes a post has' do
      expect(page).to have_content('Likes No')
    end
    it 'I can see a section for pagination if there are more posts than fit on the view' do
      expect(page).to have_content('Pagination')
    end
    it 'When I click on a post, it redirects me to that post show page' do
      click_link @first_post.title
      expect(page).to have_current_path user_post_path(@first_user, @first_post)
    end
  end
end