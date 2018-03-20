class RecipesController < ApplicationController

    def index
        @recipes = Recipe.all
        @ingredients = Ingredient.all
        respond_to do |f|
          f.html
          f.json {render json: @recipes}
        end
    end

    def scope
        @recipes = Recipe.all
    end

    def new
        @recipe = Recipe.new
        @recipe.recipe_ingredients.build
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
        @comments = Comment.all
        @comment = Comment.find_by(id: params[:id])
        respond_to do |format|
          format.html {render :show }
          format.json {render json: @recipe }
        end
    end

    def edit
        @recipe = Recipe.find_by(id: params[:id])
    end

    def update
         @recipe = Recipe.find(params[:id])
         @ingredient = Ingredient.find_by(id: params[:id])
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
        params.require(:recipe).permit(:title, :meal, :user_id, :ingredient_ids => [], :recipe_ingredients_attributes => [:name, :quantity])
    end

end
