class IngredientsController < ApplicationController
    
    def new
        @recipe = Recipe.find(params[:recipe_id])
        @ingredient = Ingredient.new(recipe_id: @recipe.id)
        @ingredients = Ingredient.all
    end
    
     def create
         @recipe = Recipe.find_by(id: params[:id])
         binding.pry
         @ingredient = Ingredient.new(ingredient_params)
             @ingredient.recipe_id = @recipe.id 
                 if @ingredient.save
             redirect_to recipe_ingredient_path(@ingredient.recipe_id, @ingredient.id)
         else 
             render :new
         end
    end
    
    def show 
        @ingredient = Ingredient.find(params[:id])
        @recipe = Recipe.find_by(id: params[:id])
        
    end
    
    def edit 
        @ingredient = Ingredient.find(params[:id])
    end
    
    def update
         @recipe = Recipe.find_by(id: params[:id])
		@ingredient = Ingredient.find_by(id: params[:id])
		@ingredient.update(ingredient_params)
	    if @ingredient.save
		redirect_to recipe_ingredient_path(@ingredient.recipe_id, @ingredient)
		else
		    render :edit
		end
    end
    
    def delete 
        @ingredient = Ingredient.find(params[:id])
        @ingredient.delete
        redirect_to recipes_path
    end
    
    
    private

    
    def ingredient_params
        params.require(:ingredient).permit(:recipe_id, :name)
    end
end
