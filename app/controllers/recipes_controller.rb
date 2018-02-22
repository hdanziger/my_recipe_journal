class RecipesController < ApplicationController
    
    def index
        @recipes = Recipe.all
        @ingredients = Ingredient.all
    end
    
    def cheese
        @recipes = Recipe.all 
        render :scope
    end
    
    def new
        @recipe = Recipe.new
        @recipes = Recipe.all
    end
    
    def create
         @recipe = Recipe.new(recipe_params)
        if @recipe.user = current_user
         if @recipe.save
            redirect_to recipe_path(@recipe)
        else
            render :new
        end
    end
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
		if @recipe.user = current_user
		    @recipe.update(recipe_params)
		redirect_to recipe_path(@recipe)
		else
		    render :edit
		end
    end
    
    def destroy
         @recipe = Recipe.find(params[:id])
        if @recipe.user = current_user
        @recipe.delete
        redirect_to recipes_path
    else 
       redirect_to recipe_path(@recipe)
    end
end

    
    private
    
    def recipe_params
        params.require(:recipe).permit(:title, :meal, :ingredient_ids => [])
    end
end
