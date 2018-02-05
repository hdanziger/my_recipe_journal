Rails.application.routes.draw do
  root 'welcome#home'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
   resources :recipes do 
    resources :ingredients, only: [:new, :edit, :create, :show]
  end
  resources :ingredients, only: [:new, :show, :create, :edit, :update, :destroy]
  resources :recipe_ingredients
  resources :users 
  
  post '/recipes/:id/delete', to: "recipes#destroy"
  post '/ingredients/:id/delete', to: "ingredients#destroy"
 
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
