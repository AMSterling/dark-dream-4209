require 'rails_helper'

RSpec.describe 'the ingredient index' do
  it 'is a list of all ingredients' do
    pasta = Ingredient.create!(name: 'Pasta', cost: 2)
    meat = Ingredient.create!(name: 'Meat', cost: 4)
    cheese = Ingredient.create!(name: 'Cheese', cost: 3)

    rice = Ingredient.create!(name: 'Rice', cost: 1)
    oil = Ingredient.create!(name: 'Oil', cost:3)
    chickpea = Ingredient.create!(name: 'Chickpeas', cost: 3)

    visit '/ingredients'

    expect(page).to have_content('Name: Pasta')
    expect(page).to have_content('Cost: 2')
    expect(page).to have_content('Name: Meat')
    expect(page).to have_content('Cost: 4')
    expect(page).to have_content('Name: Cheese')
    expect(page).to have_content('Cost: 3')
  end
end
