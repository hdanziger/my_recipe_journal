Rails.application.routes.draw do
  root 'welcome#home'
  post '/recipes/:id/delete', to: "recipes#destroy"
  
   get '/ingredients/alphabetical', to: 'ingredients#alphabetical', as: 'alphabetical'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
   resources :recipes do 
    resources :ingredients
  end
  resources :ingredients
  resources :recipe_ingredients
  resources :users, only: [:show]
  
  
 
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
