class RecipesController < ApplicationController
    
    def index
        @recipes = Recipe.all
        @ingredients = Ingredient.all
    end
    
    def new
        @recipe = Recipe.new
        @recipes = Recipe.all
        @ingredient = Ingredient.new
    end
    
    def create
         @recipe = Recipe.new(recipe_params)
        if @recipe.user = current_user
         @recipe.save
            redirect_to recipe_path(@recipe)
        else
            render :new
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
         @recipe = Recipe.find_by(id: params[:id])
        if @recipe.user = current_user
        @recipe.delete
        redirect_to recipes_path
    else 
        flash[:notice] = "You do not have permission to delete this recipe"
    end
    end

    
    private
    
    def recipe_params
        params.require(:recipe).permit(:title, :ingredient_ids => [])
    end
end
