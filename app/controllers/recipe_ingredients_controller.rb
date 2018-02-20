class RecipeIngredientsController < ApplicationController
  
  def create
    @recipe_ingredients = RecipeIngredient.all
    recipe_ingredient = add_quantity(params[:ingredient_id])
    
    recipe_ingredient.save
    
      #recipe_ingredient = current_user.recipes.add_ingredient(params[:ingredient_id])
      #if recipe_ingredient.save
          #redirect_to user_path(current_user)
      #else 
          #redirect_to recipes_path
      end
end
