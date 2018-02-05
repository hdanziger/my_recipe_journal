class WelcomeController < ApplicationController
    def home
        if user_signed_in?
            redirect_to recipes_path
        else 
            render :home
        end
    end
    
end