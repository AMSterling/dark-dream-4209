Rails.application.routes.draw do
  get '/recipes', to: 'recipes#index'
  get '/recipes/:id', to: 'recipes#show'
  get '/recipes/:recipe_id/ingredients', to: 'recipe_ingredients#index'


  get '/ingredients', to: 'ingredients#index'
end
