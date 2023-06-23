require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET /index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /new' do
    it 'returns a successful response' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'GET /show' do
    let!(:user) { User.create(Name: 'John') }

    it 'returns a successful response' do
      get :show, params: { id: 'user_id' }
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get :show, params: { id: 'user_id' }
      expect(response).to render_template(:show)
    end
  end
end
