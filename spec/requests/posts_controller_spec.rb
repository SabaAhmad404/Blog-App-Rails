require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET /index' do
    before(:example) do
      get user_posts_path(user_id: 1)
    end
    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /new' do
    before(:example) do
      get '/users/:user_id/posts/new'
    end
    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'GET /show' do
    let!(:post) { Post.create(Title: 'John') }
    before(:example) do
      get '/users/:user_id/posts/:id'
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end
  end
end
