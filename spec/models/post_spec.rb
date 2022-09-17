require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Test Post model ' do
    first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'Teacher from Mexico.')
    subject { Post.new(author: first_user, title: 'Hello', text: 'This is my first post') }
    before { subject.save }

    it 'title should be exist' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'title should not empty string' do
      subject.title = ''
      expect(subject).to_not be_valid
    end

    it 'title should not be over 250 characters' do
      subject.title = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.
             Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer
             took a galley of type and scrambled it to make a type specimen book.
              It has survived not only five centuries"
      expect(subject).to_not be_valid
    end

    it 'comments counter must be greater than zero' do
      subject.comments_counter = -2
      expect(subject).to_not be_valid
    end

    it 'comments counter should not have decimal places' do
      subject.comments_counter = 2.5
      expect(subject).to_not be_valid
    end

    it 'comments counter must be greater than zero' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end

    it 'likes counter must be greater than zero' do
      subject.likes_counter = 2.5
      expect(subject).to_not be_valid
    end
  end

  describe 'Tests Post model' do
    first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'Teacher from Mexico.')
    before { 15.times { Comment.create(post_id: subject, author: first_user, text: 'Hola Tom!') } }

    it 'recent five posts return 5 comments' do
      expect(subject.recent_five_comments).to eql(subject.comments.last(5))
    end
  end
end
