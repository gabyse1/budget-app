require 'rails_helper'

RSpec.describe "TransactionItems", type: :request do
  let(:user) { create :user }
  let(:category) { create :category, :with_icon, user: }

  before :each do
    get new_user_session_path
    sign_in user
  end

  describe 'GET /index,' do
    before { get category_transaction_items_path category.id }

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
    before { get new_category_transaction_item_path category.id }

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
    let(:transaction_attrs) do
      { name: 'fruit transaction', amount: 9.99, category_id: category.id, user_id: user.id }
    end

    it 'should increment the transaction_item database table count from 0 to 1.' do
      expect do
        post category_transaction_items_path category.id, params: { transaction_item: transaction_attrs }
      end.to change { TransactionItem.count }.from(0).to(1)
    end

    it 'should redirect to the transaction items list page.' do
      post category_transaction_items_path category.id, params: { transaction_item: transaction_attrs }
      follow_redirect!
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:index)
      expect(response.body).to include('Transaction was successfully created.')
    end
  end
end
