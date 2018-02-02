Rails.application.routes.draw do
  root 'welcome#home'
  resources :recipes
  resources :ingredients, only: [:new, :show, :create, :edit, :update]
  resources :recipe_ingredients
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :users, only: [:show]
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
