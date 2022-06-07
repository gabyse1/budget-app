require 'rails_helper'

RSpec.describe "Categories", type: :request do
  let(:user) { create :user }

  before :each do
    get new_user_session_path
    sign_in user
  end

  describe "GET /index," do
    before { get categories_path }
  
    it 'should get a success response.' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the index template.' do
      expect(response).to render_template(:index)
    end

    it "shouldn't render a different template." do
      expect(response).to_not render_template(:new)
    end
  end

  describe 'GET /new' do
    before { get new_category_path }

    it 'should get a success response.' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render the new template.' do
      expect(response).to render_template(:new)
    end

    it "shouldn't render a different template." do
      expect(response).to_not render_template(:index)
    end
  end

  describe 'POST /create' do
    let(:category_attrs) do
      { name: 'rent', icon: fixture_file_upload('me-about-to-penguin.jpeg', 'image/jpeg') }
    end

    it 'should increment the category database table count from 0 to 1.' do
      expect do
        post categories_path, params: { category: category_attrs }
      end.to change { Category.count }.from(0).to(1)
    end

    it 'should redirect to the category list page.' do
      post categories_path, params: { category: category_attrs }
      follow_redirect!
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
      expect(response.body).to include('Category was successfully created.')
    end
  end
end
