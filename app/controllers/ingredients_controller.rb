class IngredientsController < ApplicationController
    
    def alphabetical
		    @ingredients = Ingredient.all
		end
    
    def new
        @recipe = Recipe.find(params[:recipe_id])
        @ingredient = Ingredient.new(recipe_id: @recipe.id)
        @ingredients = Ingredient.all
    end
    
     def create
         @recipe = Recipe.find_by(id: params[:recipe_id])
         @ingredient = Ingredient.new(ingredient_params)
         @ingredient.recipes << @recipe
            if @ingredient.save
             redirect_to recipe_ingredient_path(@recipe.id, @ingredient.id)
         else 
             render :new
         end
    end
    
    def show 
        @ingredient = Ingredient.find(params[:id])
        @recipe = Recipe.find_by(id: params[:recipe_id])
        @ingredients = Ingredient.all
        
    end
 
    def edit 
        @ingredient = Ingredient.find(params[:id])
        @recipe = Recipe.find_by(id: params[:recipe_id])
    end
    
    def update
         @recipe = Recipe.find_by(id: params[:recipe_id])
		@ingredient = Ingredient.find_by(id: params[:id])
		if @ingredient.update(ingredient_params)
		redirect_to recipe_ingredient_path(@recipe.id, @ingredient)
		else
		    render :edit
		end
	end
    
    private
    def ingredient_params
        params.require(:ingredient).permit(:name)
    end
end
