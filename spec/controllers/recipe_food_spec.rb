require 'rails_helpers'

RSpec.describe Recipe, type: :model do
  before :each do
    @user = User.create(name: 'test_user', email: 'testUser@test.com', password: 123_456,
                        password_confirmation: 123_456)
    @user.skip_confirmation!
    @recipe = Recipe.create!(name: 'Pizza', preparation_time: '2 hours', cooking_time: '2 hours',
                             description: 'Test', public: false, author_id: @user.id, user: @user)
    @food = Food.create(name: 'Olive Oil', measurement_unit: 'bottle', price: 25, author_id: @user.id)
  end
  it 'is valid' do
    recipe_food = RecipeFood.new(recipe_id: @recipe.id, food_id: @food.id, quantity: 2)
    expect(recipe_food).to be_valid
  end
  it 'should not be valid without quantity' do
    recipe_food = RecipeFood.new(recipe_id: @recipe.id, food_id: @food.id, quantity: nil)
    expect(recipe_food).to_not be_valid
  end
end
