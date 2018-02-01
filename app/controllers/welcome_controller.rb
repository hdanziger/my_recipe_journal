class WelcomeController < ApplicationController
    def home
          if signed_in?
            redirect_to recipes_path
        else 
            redirect_to '/'
        end
    end
    
     def destroy
        session.delete :user_id
        redirect_to '/'
    end
    
    
end