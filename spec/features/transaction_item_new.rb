require 'rails_helper'

RSpec.describe 'TransactionItem #new,', type: :feature do
  let!(:user) { create :user }
  let!(:category) { create :category, :with_icon, user: }

  before :each do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit new_category_transaction_item_path category.id
  end

  context 'when load the transaction form, its fields and save button' do
    it 'should be present' do
      name_field = find_field('transaction_item[name]')
      amount_field = find_field('transaction_item[amount]')
      submit_button = find_button('Save')
      expect(name_field).to_not be_nil
      expect(amount_field).to_not be_nil
      expect(submit_button).to_not be_nil
    end
  end

  describe 'Submit form' do
    let(:submit) { 'Save' }

    before :each do
      fill_in 'transaction_item[name]', with: 'fruit transaction'
      fill_in 'transaction_item[amount]', with: 9.99
    end

    context 'without name' do
      it "should return `Name can't be blank` message." do
        fill_in 'transaction_item[name]', with: nil
        click_button submit
        expect(page).to have_text("Name can't be blank")
      end
    end

    context 'without amount' do
      it "should return `Amount can't be blank` message." do
        fill_in 'transaction_item[amount]', with: nil
        click_button submit
        expect(page).to have_text("Amount can't be blank")
      end
    end

    context 'with complete and correct data' do
      it 'should redirect to the transactions list page' do
        click_button submit
        expect(current_path).to eq(category_transaction_items_path category.id)
      end

      it 'should return `Transaction was successfully created.` message.' do
        click_button submit
        expect(page).to have_text('Transaction was successfully created.')
      end
    end
  end
end
