require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @user = User.new(name: 'John', email: 'john@example.com', password: 'password')
    @food = @user.foods.new(name: 'apple', measurement_unit: 'pieces', price: 1.5, quantity: 5)
  end

  it 'has a name' do
    expect(@food.name).to eq('apple')
  end

  it 'has a measurement unit' do
    expect(@food.measurement_unit).to eq('pieces')
  end

  it 'has a price' do
    expect(@food.price).to eq(1.5)
  end

  it 'has a quantity' do
    expect(@food.quantity).to eq(5)
  end
end
