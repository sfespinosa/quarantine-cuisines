Rails.application.routes.draw do
  resources :ingredients, only: [:index, :show]
  # resources :favorite_meals
  # resources :recipes
  get 'meals/category', to: 'meals#category', as: 'category'
  resources :meals, only: [:index, :show]
  get 'meals/:id/favorite', to: 'meals#favorite', as: 'favorite'
  resources :users, only: [:show, :new, :create]

  get '/login', to: 'auth#login', as: 'login'
  post '/login', to: 'auth#verify_username'
  get '/logout', to: 'auth#logout', as: 'logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
