require 'rails_helper'

describe Food do
  create_food = Food.new(name: 'tomato', measurement_unit: 'KGS', price: 15)
  subject { create_food }

  before { subject.save }

  it 'name shouldn`t be empty' do
    subject.name = 'tomato'
    expect(subject.name).to eq 'tomato'
  end
  it 'measurement_unit field ' do
    subject.measurement_unit = 'KGS'
    expect(subject.measurement_unit).to eq 'KGS'
  end

  it 'price must be an integer ' do
    subject.price = 7
    expect(subject.price).to be >= 0
  end
end
