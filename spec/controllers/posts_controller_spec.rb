require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'POST / GET index' do
    before(:example) do
      get '/users/1/posts'
    end

    it 'returns a 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end

    it 'response body includes correct placeholder text' do
      response.body = 'Posts Index'
    end
  end

  describe 'POST / GET show' do
    before(:example) do
      get '/users/1/posts/1'
    end

    it 'returns a 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template('show')
    end

    it 'response body includes correct placeholder text' do
      response.body = 'Posts Index'
    end
  end
end
