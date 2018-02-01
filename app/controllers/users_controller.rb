class UsersController < ApplicationController
    
     def home
    end
    
    def sign_in
        if signed_in?
            redirect_to recipes_path
        else 
            redirect_to '/'
        end
    end
    
      def show
        @recipes = Recipe.all
        @user = User.find_by(id: params[:id])
    end
    
    
    def destroy
        session.delete :user_id
        redirect_to '/'
    end
    
  
end