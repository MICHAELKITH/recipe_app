require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    @user = User.new(name: 'John', email: 'john@example.com', password: 'password123')
    @recipe = @user.recipes.new(name: 'spaghetti', preparation_time: 30, cooking_time: 45,
                                description: 'Delicious spaghetti recipe', public: true)
  end

  it 'has correct attributes' do
    expect(@recipe.name).to eq('spaghetti')
    expect(@recipe.preparation_time).to eq(30)
    expect(@recipe.cooking_time).to eq(45)
    expect(@recipe.description).to eq('Delicious spaghetti recipe')
    expect(@recipe.public).to eq(true)
  end
end

RSpec.describe Recipe, type: :model do
  before(:each) do
    @user = User.new(name: 'John', email: 'john@example.com', password: 'password123')
    @recipe = @user.recipes.new(name: 'spaghetti', preparation_time: 30, cooking_time: 45,
                                description: 'Delicious spaghetti recipe', public: true)
  end

  it 'has correct attributes' do
    expect(@recipe.name).to eq('spaghetti')
    expect(@recipe.preparation_time).to eq(30)
    expect(@recipe.cooking_time).to eq(45)
    expect(@recipe.description).to eq('Delicious spaghetti recipe')
    expect(@recipe.public).to eq(true)
  end
end
