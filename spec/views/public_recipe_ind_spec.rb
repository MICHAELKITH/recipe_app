require 'rails_helper'

RSpec.describe 'Recipes', type: :feature do
  include Devise::Test::IntegrationHelpers

  describe 'show' do
    before(:each) do
      @user = User.create(name: 'Alice', email: 'alice@example.com', password: 'password123')
      sign_in @user
      @recipe = Recipe.create(user: @user, name: 'Pasta', preparation_time: 30, cooking_time: 15,
                              description: 'Italian Dish', public: true)
      visit recipe_path(@recipe.id)
    end

    it 'displays the name of the recipe' do
      expect(page).to have_content(@recipe.name)
    end

    it 'displays the description of the recipe' do
      expect(page).to have_content(@recipe.description)
    end

    it 'displays the preparation time' do
      expect(page).to have_content(@recipe.preparation_time)
    end

    it 'displays the cooking time' do
      expect(page).to have_content(@recipe.cooking_time)
    end

    it 'renders a button to add ingredient' do
      expect(page).to have_content('Add Ingredient')
    end

    it 'redirects to the add ingredient page when the button is clicked' do
      click_link 'Add Ingredient'
      expect(page).to have_current_path(new_recipe_recipe_food_path(@recipe))
    end

    it 'renders a button to generate shopping list' do
      expect(page).to have_content('Generate Shopping List')
    end

    it 'redirects to the shopping list page when the button is clicked' do
      click_link 'Generate Shopping List'
      expect(page).to have_current_path(shopping_lists_path)
    end
  end
end
