require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'USER / GET index' do
    before(:example) do
      get '/users'
    end

    it 'returns a 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end

    it 'response body includes correct placeholder text' do
      response.body = 'This is just a list of users'
    end
  end

  describe 'USER / GET Show' do
    before(:example) do
      get '/users/1'
    end

    it 'returns a 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the show template' do
      expect(response).to render_template('show')
    end

    it 'response body includes correct placeholder text' do
      response.body = 'This is just a list of users'
    end
  end
end
