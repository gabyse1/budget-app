require 'rails_helper'

RSpec.describe TransactionItem, type: :model do
  let(:user) { build :user }
  let(:category) { build :category, :with_icon, user: }
  let(:transaction_item) { build :transaction_item, category:, user: }

  context 'when validates, name' do
    it 'should be present' do
      transaction_item.name = nil
      expect(transaction_item).to_not be_valid
    end
  end

  context 'when validates, amount' do
    it 'should be present' do
      transaction_item.amount = nil
      expect(transaction_item).to_not be_valid
    end

    it 'should be a number' do
      transaction_item.amount = 'aaa'
      expect(transaction_item).to_not be_valid
    end
  end

  context 'when validates, category' do
    it 'should be present' do
      transaction_item.category = nil
      expect(transaction_item).to_not be_valid
    end
  end

  context 'when validates, user' do
    it 'should be present' do
      transaction_item.user = nil
      expect(transaction_item).to_not be_valid
    end
  end
end
