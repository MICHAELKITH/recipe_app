require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:recipe) { Recipe.new(name: 'Pizza') }
  let(:food) { Food.new(name: 'Cheese', measurement_unit: 'grams', price: 10, quantity: 10) }

  subject(:recipe_food) { described_class.new(recipe:, food:, quantity: 2) }

  it 'belongs to a recipe' do
    expect(recipe_food.recipe).to eq(recipe)
  end

  it 'belongs to a food' do
    expect(recipe_food.food).to eq(food)
  end

  it 'has a quantity' do
    expect(recipe_food.quantity).to eq(2)
  end
end
