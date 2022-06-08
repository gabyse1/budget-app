require 'rails_helper'

RSpec.describe 'TransactionItem #index,', type: :feature do
  let!(:user) { create :user }
  let!(:category) { create :category, :with_icon, user: }
  let!(:transaction_item) { create :transaction_item, category:, user: }

  before :each do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Next'
    visit category_transaction_items_path category.id
  end

  context 'when loads the page' do
    it 'should display the `New Transaction` button' do
      new_link = find_link(href: new_category_transaction_item_path(category.id))
      expect(new_link).to_not be_nil
    end
  end

  context 'when loads the transactions list' do
    it 'should display the transactions name.' do
      expect(page).to have_text(transaction_item.name)
    end

    it 'shoud display the transaction amount.' do
      expect(page).to have_text(transaction_item.amount)
    end
  end

  context 'when click on New Transaction button' do
    it 'should redirect to the new transaction form path.' do
      click_link(href: new_category_transaction_item_path(category.id))
      expect(current_path).to eq(new_category_transaction_item_path(category.id))
    end
  end
end
