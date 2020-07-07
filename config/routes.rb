Rails.application.routes.draw do
  # resources :ingredients
  # resources :favorite_meals
  # resources :recipes
  resources :meals, only: [:index, :show]
  resources :users, only: [:new, :create]

  get '/login', to: 'auth#login', as: 'login'
  post '/login', to: 'auth#verify_username'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
