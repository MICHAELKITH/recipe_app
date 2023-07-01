require 'rails_helper'

RSpec.describe 'Recipes', type: :feature do
  include Devise::Test::IntegrationHelpers
  
  describe 'index' do
    before(:each) do
      @user = User.create(name: 'Alice', email: 'alice@example.com', password: 'password123')
      sign_in @user
      @recipe = Recipe.create(user: @user, name: 'Pasta', preparation_time: 30, cooking_time: 15,
                              description: 'Italian Dish', public: true)
      visit recipes_path
    end

    it 'displays the name of the recipe' do
      expect(page).to have_content(@recipe.name)
    end

    it 'displays the description of the recipe' do
      expect(page).to have_content(@recipe.description)
    end

    it 'renders a button to add a new recipe' do
      expect(page).to have_content('Add Recipe')
    end

    it 'redirects to the form for creating a new recipe' do
      click_link 'Add Recipe'
      expect(page).to have_current_path(new_recipe_path)
    end
  end
end
