Rails.application.routes.draw do
  root "meals#home"
  resources :reviews, only: [:create, :destroy]
  resources :ingredients, only: [:index, :show]
  resources :meals, only: [:index, :show]
  get 'meals/:id/favorite', to: 'meals#favorite', as: 'favorite'
  get 'reviews/:id/edit', to: 'reviews#edit', as: 'edit_review'
  patch 'reviews/:id', to: 'reviews#update', as: 'update_review'
  resources :users, only: [:show, :new, :create]

  #login/logout paths
  get '/login', to: 'auth#login', as: 'login'
  post '/login', to: 'auth#verify_username'
  get '/logout', to: 'auth#logout', as: 'logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
