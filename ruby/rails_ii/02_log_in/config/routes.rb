Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'users/show'
  # get 'users/user_params'

  root "sessions#new"
  resources :users
  resources :sessions
end
