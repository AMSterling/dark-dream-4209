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

  it 'shows the number of recipes each ingredient is used in' do
    spaghetti = Recipe.create!(name: 'Spaghetti', complexity: 2, genre: 'Italian')
    fried = Recipe.create!(name: 'Fried Rice', complexity: 3, genre: 'Chinese')
    falafel = Recipe.create!(name: 'Falafel', complexity: 4, genre: 'Mediterranean')

    pasta = Ingredient.create!(name: 'Pasta', cost: 2)
    meat = Ingredient.create!(name: 'Meat', cost: 4)
    cheese = Ingredient.create!(name: 'Cheese', cost: 3)

    rice = Ingredient.create!(name: 'Rice', cost: 1)
    oil = Ingredient.create!(name: 'Oil', cost:3)
    chickpea = Ingredient.create!(name: 'Chickpeas', cost: 3)

    spaghetti_pasta = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: pasta.id)
    spaghetti_meat = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: meat.id)
    spaghetti_cheese = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: cheese.id)

    fried_rice = RecipeIngredient.create!(recipe_id: fried.id, ingredient_id: rice.id)
    fried_oil = RecipeIngredient.create!(recipe_id: fried.id, ingredient_id: oil.id)

    flafel_chickpea = RecipeIngredient.create!(recipe_id: falafel.id, ingredient_id: chickpea.id)
    falafel_oil = RecipeIngredient.create!(recipe_id: falafel.id, ingredient_id: oil.id)

    visit '/ingredients'
    
    expect(page).to have_content('Name: Pasta: 1')
    expect(page).to have_content('Name: Meat: 1')
    expect(page).to have_content('Name: Cheese: 1')
    expect(page).to have_content('Name: Rice: 1')
    expect(page).to have_content('Name: Oil: 2')
    expect(page).to have_content('Name: Chickpeas: 1')
  end
end

# User Story 3 of 4
# As a visitor,
# When I visit '/ingredients'
# I see a list of ingredients and the number of recipes each ingredient is used in.
# (e.g. "Ground Beef: 2"
#      "Salt: 4")
