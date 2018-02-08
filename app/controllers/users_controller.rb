class UsersController < ApplicationController
    
    def show
        @recipes = Recipe.all
        @user = User.find_by(id: params[:id])
    end

    
     def destroy
        session.delete :user_id
        redirect_to root_path
    end
    
    
    
   
  
end