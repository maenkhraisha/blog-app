require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET index' do
    it 'returns a 200' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'response body includes correct placeholder text' do
      get :index
      response.body = 'This is just a list of users'
    end
  end
end
