require 'rails_helper'

RSpec.describe 'the recipe ingredient show page' do
  it 'shows a list of the recipes ingredients' do
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

    visit "/recipes/#{spaghetti.id}"

    expect(page).to have_content('Spaghetti')
    expect(page).to have_content('Ingredient: Pasta')
    expect(page).to have_content('Ingredient: Meat')
    expect(page).to have_content('Ingredient: Cheese')
    expect(page).to_not have_content('Fried Rice')
    expect(page).to_not have_content('Falafel')

    visit "/recipes/#{fried.id}"

    expect(page).to have_content('Fried Rice')
    expect(page).to have_content('Ingredient: Rice')
    expect(page).to have_content('Ingredient: Oil')
    expect(page).to_not have_content('Spaghetti')
    expect(page).to_not have_content('Falafel')

    visit "/recipes/#{falafel.id}"

    expect(page).to have_content('Falafel')
    expect(page).to have_content('Ingredient: Chickpeas')
    expect(page).to have_content('Ingredient: Oil')
    expect(page).to_not have_content('Spaghetti')
    expect(page).to_not have_content('Fried Rice')
  end

  it 'shows the total cost of each recipe on its page' do
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

    visit "/recipes/#{spaghetti.id}"

    expect(page).to have_content('Total Cost: 9')

    visit "/recipes/#{fried.id}"

    expect(page).to have_content('Total Cost: 4')

    visit "/recipes/#{falafel.id}"

    expect(page).to have_content('Total Cost: 6')
  end
end

# User Story 4 of 4
# As a visitor,
# When I visit '/recipes/:id'
# I see the total cost of all of the ingredients in the recipe.
# (e.g. "Total Cost: 22")
