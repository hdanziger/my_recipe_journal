Rails.application.routes.draw do
  root 'welcome#home'
  post '/recipes/:id/delete', to: "recipes#destroy"
  post '/recipes/:recipe_id/comments/:id/delete', to: "comments#destroy"
  
   get '/ingredients/alphabetical', to: 'ingredients#alphabetical', as: 'alphabetical'
   get '/recipes/scope', to: 'recipes#scope', as: 'scope'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
   resources :recipes do 
    resources :ingredients
    resources :comments, only: [:new, :create, :edit, :update, :show, :destroy]
  end
 
  resources :ingredients, only: [:new, :create, :edit, :update, :alphabetical, :show]
  resources :recipe_ingredients
  resources :users, only: [:show]
  
  
 
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
