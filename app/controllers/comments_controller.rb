class CommentsController < ApplicationController

    def new
        @recipe = Recipe.find_by(id: params[:recipe_id])
       @comments = @recipe.comments
        @comment = Comment.new(recipe_id: @recipe.id)
    end

    def create
        @recipe = Recipe.find_by(id: params[:recipe_id])
        @comment = @recipe.comments.new(comment_params)
         if @comment.user = current_user
        #binding.pry
            if @comment.save
                render partial: 'comments/comments', :layout => false
                #redirect_to @recipe
            else
                render :new
             end
        end
    end

    def show
        @recipe = Recipe.find_by(id: params[:recipe_id])
        @comment = @recipe.comments.find_by(id: params[:id])
    end

    def edit
        @comment = Comment.find_by(id: params[:id])
        @recipe = Recipe.find_by(id: params[:recipe_id])
    end

    def update
        @comment = Comment.find_by(id: params[:id])
        @recipe = Recipe.find_by(id: params[:recipe_id])
           if @comment.update(comment_params)
            redirect_to recipe_comment_path(@recipe.id, @comment)
        else
            render :edit
        end
    end


    def destroy
          @comment = Comment.find(params[:id])
        if @comment.user = current_user
            @comment.delete
            redirect_to recipes_path
         else
            redirect_to recipe_comment_path(@comment)
        end
    end



    private
    def comment_params
        params.require(:comment).permit(:text, :recipe_id, :user_id)
    end

end
