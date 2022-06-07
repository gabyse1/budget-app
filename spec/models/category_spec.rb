require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { build :user }
  let(:category) { build :category, :with_icon, user: }

  context 'when validates, name' do
    it 'should be present' do
      category.name = nil
      expect(category).to_not be_valid
    end
  end

  context 'when validates, icon' do
    it 'should be present' do
      category.icon = nil
      expect(category).to_not be_valid
    end
  end

  context 'with a valid file, icon' do
    it "should is attached" do
      expect(category.icon).to be_attached
    end
  end

  context 'when call category_total_amount method' do
    it "should return the total amount of a given category's transactions." do
      expect(category.category_total_amount).to be_zero
    end
  end
end
