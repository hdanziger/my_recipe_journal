Rails.application.routes.draw do
  root 'welcome#home'
  get '/recipes/:id/delete', to: "recipes#delete"
  get '/ingredients/:id/delete', to: "ingredients#delete"
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
   resources :recipes do 
    resources :ingredients, only: [:new, :edit] 
  end
  resources :ingredients
  resources :recipe_ingredients
  resources :users, only: [:show]
  
  
 
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
