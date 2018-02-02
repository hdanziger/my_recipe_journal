class RecipesController < ApplicationController
    
    def index
        @recipes = Recipe.all
        @ingredients = Ingredient.all
        redirect_to recipes_path
    end
    
    def new
        @recipe = Recipe.new
        @recipes = Recipe.all
        @ingredient = Ingredient.new
    end
    
    def create
         @recipe = Recipe.new(recipe_params)
        @recipe.user = current_user
         @recipe.save
            redirect_to @recipe
      
        end
    
    def show
        @recipe = Recipe.find_by(id: params[:id])
        @recipes = Recipe.all
    end
    
    def edit 
        @recipe = Recipe.find_by(id: params[:id])
    end
    
    def update
         @recipe = Recipe.find(params[:id])
		@recipe.update(recipe_params)
		if @recipe.save
		redirect_to recipe_path(@recipe)
		else 
		    render :edit
		end
    end
    
    private
    
    def recipe_params
        params.require(:recipe).permit(:title, :user_id, :ingredient_ids => [])
    end
end
