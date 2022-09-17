require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Tests User model validation' do
    subject { User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.') }

    before { subject.save }

    it 'User name should be exist' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'User name should not be empty string' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'Posts Counter should be grete than zero' do
      subject.posts_counter = -2
      expect(subject).to_not be_valid
    end

    it 'Post counter should not have dicemal places' do
      subject.posts_counter = 2.5
      expect(subject).to_not be_valid
    end
  end

  describe 'Test User model methods' do
    before { 15.times { Post.create(author: subject, title: 'Hello', text: 'This is my first post') } }

    it 'Recent post method should return the last three posts' do
      expect(subject.recent_three_posts).to eql(subject.posts.last(3))
    end
  end
end
