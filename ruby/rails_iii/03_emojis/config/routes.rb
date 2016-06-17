Rails.application.routes.draw do
  root 'emojis#index'
  get 'mood' => 'emojis#mood'
  post 'mood' => 'emojis#mood'
end
