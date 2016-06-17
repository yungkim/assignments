Rails.application.routes.draw do
  get 'secrets/' => 'secrets#index'
  post 'secrets/create' => 'secrets#create'
  delete 'secrets/destroy'

  root "sessions#new"
  resources :users
  resources :sessions
  delete 'sessions' => 'sessions#logout'
end
