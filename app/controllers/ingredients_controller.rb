class IngredientsController < ApplicationController
    before_action :set_recipe
    before_action :set_ingredient
    
    def alphabetical
		 @ingredients = Ingredient.all
    end
    
    def new
        @ingredients = @recipe.ingredients
        @ingredient = Ingredient.new(recipe_id: @recipe.id)
    end
    
    def create
        @ingredient = @recipe.ingredients.new(ingredient_params)
        @ingredient.recipes << @recipe
            if @ingredient.save
                redirect_to recipe_ingredient_path(@recipe.id, @ingredient.id)
            else 
                render :new
            end
    end
    
    def show 
        @ingredient = @recipe.ingredients.find_by(id: params[:id])
    end
 
    
    private
    def ingredient_params
        params.require(:ingredient).permit(:name, :recipe_id)
    end
    
    def set_recipe
        @recipe = Recipe.find_by(id: params[:recipe_id])
    end
    
    def set_ingredient
        @ingredient = Ingredient.find_by(id: params[:id])
    end
end
