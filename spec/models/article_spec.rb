require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) { User.create(email: 'test@user.com', password: 'password') }

  describe 'Article associations test' do
    it 'belongs to a user' do
      article = user.articles.build(title: 'Test Article', body: 'Sample test article')
      expect(article.user).to eq(user)
    end
  end

  describe "Article validations test" do
    it 'is valid with valid attributes' do
      article = Article.new(title: 'Test Article', body: 'Sample test article', user: user)
      expect(article).to be_valid
    end

    it 'is not valid without a title' do
      article = Article.new(body: 'Sample article', user: user)
      expect(article).not_to be_valid
    end

    it 'is not valid without body' do
      article = Article.new(title: 'Test Article', user: user)
      expect(article).not_to be_valid
    end
  end
end
