require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'POST GET index' do
    it 'returns a 200' do
      get user_posts_path(user_id: 22, id: 50)
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get user_posts_path(user_id: 22, id: 50)
      expect(response).to render_template('index')
    end

    it 'response body includes correct placeholder text' do
      get user_posts_path(user_id: 22, id: 50)
      response.body = 'Posts Index'
    end
  end
end

RSpec.describe PostsController, type: :request do
  describe 'POST GET show' do
    it 'returns a 200' do
      get user_post_path(user_id: 22, id: 50)
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get user_post_path(user_id: 22, id: 50)
      expect(response).to render_template('show')
    end

    it 'response body includes correct placeholder text' do
      get user_post_path(user_id: 22, id: 50)
      response.body = 'Posts Index'
    end
  end
end
