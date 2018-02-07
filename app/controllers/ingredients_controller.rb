class IngredientsController < ApplicationController
    
    def new
        @recipe = Recipe.find(params[:recipe_id])
        @ingredient = Ingredient.new(recipe_id: @recipe.id)
        @ingredients = Ingredient.all
    end
    
    def create
         @ingredient = Ingredient.new(ingredient_params)
             if @ingredient.save
             redirect_to ingredient_path(@ingredient)
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
		@ingredient = Ingredient.find_or_create_by(ingredient_params)
		@ingredient.update(ingredient_params)
	    if @ingredient.save
		redirect_to recipe_ingredient_path(@ingredient.recipe_id, @ingredient)
		else
		    render :edit
		end
    end
    
    def destroy 
        @ingredient = Ingredient.find(params[:id])
        @ingredient.delete
        redirect_to recipes_path
    end
    
    
    private

    
    def ingredient_params
        params.require(:ingredient).permit(:name, :recipe_id)
    end
end
