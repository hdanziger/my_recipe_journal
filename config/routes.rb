Rails.application.routes.draw do
  root 'welcome#home'
  get '/recipes/:id/delete', to: "recipes#destroy"
  get '/ingredients/:id/delete', to: "ingredients#destroy"
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
   resources :recipes do 
    resources :ingredients, only: [:new, :edit, :create, :show]
  end
  resources :ingredients, only: [:new, :show, :create, :edit, :update, :destroy]
  resources :recipe_ingredients
  resources :users, only: [:show]
  
  
 
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
