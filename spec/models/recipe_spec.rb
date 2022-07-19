require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe 'model methods' do
    it 'is the total cost of all ingredients used in this recipe' do
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

      expect(spaghetti.total_cost).to eq(9)
      expect(fried.total_cost).to eq(4)
      expect(falafel.total_cost).to eq(6)
    end
  end
end
