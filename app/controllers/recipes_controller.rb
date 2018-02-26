class RecipesController < ApplicationController
    
    def index
        @recipes = Recipe.all
        @ingredients = Ingredient.all
    end
    
    def scope
        @recipes = Recipe.all 
    end
    
    def new
        @recipe = Recipe.new
       @recipe.ingredients.build

    end
    
    def create
       # binding.pry
         @recipe = Recipe.new(recipe_params)
         binding.pry
        @recipe.recipe_ingredients.update(quantity: params[:recipe][:recipe_ingredients][:quantity])
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
        params.require(:recipe).permit(:title, :meal, :user_id, :ingredient_ids => [], :ingredients_attributes => [:name])
    end
end
