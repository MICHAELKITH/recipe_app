require 'rails_helper'

RSpec.describe 'Foods', type: :feature do
  include Devise::Test::IntegrationHelpers

  describe 'index' do
    before(:each) do
      @user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password')
      sign_in @user
      @food = Food.create(user: @user, name: 'Banana', measurement_unit: 'piece', quantity: 5, price: 50)
      visit foods_path
    end

    it 'displays the name of the food' do
      expect(page).to have_content(@food.name)
    end

    it 'displays the measurement unit of the food' do
      expect(page).to have_content(@food.measurement_unit)
    end

    it 'displays the price of the food' do
      expect(page).to have_content(50)
    end

    it 'renders a button to add food' do
      expect(page).to have_content('Add Food')
    end

    it 'redirects to the new food form' do
      click_link 'Add Food'
      expect(page).to have_current_path(new_food_path)
    end
  end
end
