require 'rails_helper'

RSpec.describe 'Category,', type: :feature do
  let!(:user) { create :user }

  before :each do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Next'

    visit new_category_path
  end

  context 'when load the category form, its fields and save button' do
    it 'should be present' do
      name_field = find_field('category[name]')
      icon_field = find_field('category[icon]')
      submit_button = find_button('Save')
      expect(name_field).to_not be_nil
      expect(icon_field).to_not be_nil
      expect(submit_button).to_not be_nil
    end
  end

  describe 'Submit form' do
    let(:submit) { 'Save' }

    before :each do
      fill_in 'category[name]', with: 'food category'
      attach_file 'category[icon]', Rails.root.join('spec/fixtures/files', 'me-about-to-penguin.jpeg')
    end

    context 'without name' do
      it "should return `Name can't be blank` message." do
        fill_in 'category[name]', with: nil
        click_button submit
        expect(page).to have_text("Name can't be blank")
      end
    end

    context 'without icon' do
      it "should return `Icon can't be blank` message." do
        attach_file 'category[icon]', nil
        click_button submit
        expect(page).to have_text("Icon can't be blank")
      end
    end

    context 'with complete and correct data' do
      it 'should redirect to the category list page' do
        click_button submit
        expect(current_path).to eq(categories_path)
      end

      it 'should return `Category was successfully created.` message.' do
        click_button submit
        expect(page).to have_text('Category was successfully created.')
      end
    end
  end
end
