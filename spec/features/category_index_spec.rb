require 'rails_helper'

RSpec.describe 'Category,', type: :feature do
  let!(:user) { create :user }
  let!(:category) { create :category, :with_icon, user: }

  before :each do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Next'
    visit categories_path
  end

  context 'when loads the page' do
    it 'should display the `New Category` button' do
      new_link = find_link(href: new_category_path)
      expect(new_link).to_not be_nil
    end
  end

  context 'when loads the category list' do
    it 'should display the categories name' do
      expect(page).to have_text(category.name)
    end

    it 'should display the category icon' do
      category_icon = find_by_id("img-#{category.icon.filename}")
      expect(category_icon).to_not be_nil
    end
  end

  context 'when click on New Category link' do
    it 'should redirect to the new category form path' do
      click_link(href: new_category_path)
      expect(current_path).to eq(new_category_path)
    end
  end
end
