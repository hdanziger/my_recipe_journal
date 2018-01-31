Rails.application.routes.draw do
  root 'welcome#home'
  resources :recipe_ingredients
  resources :ingredients
  resources :recipes
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
