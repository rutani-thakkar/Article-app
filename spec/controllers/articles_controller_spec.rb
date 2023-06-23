require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  include Devise::Test::ControllerHelpers

  before do
    @user = User.create(email: 'test@example.com', password: 'password')
    sign_in @user
  end

  let(:valid_attributes) {
    { title: 'First Article', body: 'Test Article', user: @user }
  }

  let(:invalid_attributes) {
    { title: '', body: 'Test Article', user: @user }
  }

  describe 'GET index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET show' do
    it 'returns a successful response' do
      article = Article.create(valid_attributes)
      get :show, params: { id: article.to_param }
      expect(response).to be_successful
    end
  end

  describe 'GET new' do
    it 'returns a successful response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST create' do
    context 'with valid parameters' do
      it 'creates a new article' do
        expect {
          post :create, params: { article: valid_attributes }
        }.to change(Article, :count).by(1)
      end

      it 'redirects to the created article' do
        post :create, params: { article: valid_attributes }
        expect(response).to redirect_to(Article.last)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new article' do
        expect {
          post :create, params: { article: invalid_attributes }
        }.to change(Article, :count).by(0)
      end

      it 'returns a success response' do
        post :create, params: { article: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        { title: 'Updated Article' }
      }

      it 'updates the requested article' do
        article = Article.create(valid_attributes)
        put :update, params: { id: article.to_param, article: new_attributes }
        article.reload
        expect(article.title).to eq(new_attributes[:title])
      end

      it 'redirects to the article' do
        article = Article.create(valid_attributes)
        put :update, params: { id: article.to_param, article: valid_attributes }
        expect(response).to redirect_to(article)
      end
    end

    context 'with invalid parameters' do
      it 'returns a success response' do
        article = Article.create(valid_attributes)
        put :update, params: { id: article.to_param, article: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested article' do
      article = Article.create(valid_attributes)
      expect {
        delete :destroy, params: { id: article.to_param }
      }.to change(Article, :count).by(-1)
    end

    it 'redirects to the articles list' do
      article = Article.create(valid_attributes)
      delete :destroy, params: { id: article.to_param }
      expect(response).to redirect_to(articles_url)
    end
  end
end
