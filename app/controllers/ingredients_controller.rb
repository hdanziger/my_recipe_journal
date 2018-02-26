class IngredientsController < ApplicationController
    
    def alphabetical
		    @ingredients = Ingredient.all
		end
    
    def new
        @recipe = Recipe.find(params[:recipe_id])
         @ingredients = @recipe.ingredients
        @ingredient = Ingredient.new(recipe_id: @recipe.id)
    end
    
     def create
         @recipe = Recipe.find_by(id: params[:recipe_id])
         @ingredient = @recipe.ingredients.new(ingredient_params)
         @ingredient.recipes << @recipe
            if @ingredient.save
             redirect_to recipe_ingredient_path(@recipe.id, @ingredient.id)
         else 
             render :new
         end
    end
    
    def show 
        @recipe = Recipe.find_by(id: params[:recipe_id])
        @ingredient = @recipe.ingredients.find_by(id: params[:id])
    end
 
    def edit 
        @ingredient = Ingredient.find(params[:id])
        @recipe = Recipe.find_by(id: params[:recipe_id])
    end

    
    def update
         @recipe = Recipe.find_by(id: params[:recipe_id])
		@ingredient = Ingredient.find_by(id: params[:id])
		if @ingredient.update(ingredient_params)
		redirect_to ingredient_path(@ingredient)
		else
		    render :edit
		end
	end
    
    private
    def ingredient_params
        params.require(:ingredient).permit(:name, :recipe_id)
    end
end
