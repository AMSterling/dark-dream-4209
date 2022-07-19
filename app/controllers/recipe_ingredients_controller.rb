class RecipeIngredientsController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @ingredients = @recipe.ingredients
  end
end
