Rails.application.routes.draw do
  get 'rpg/index'
  post 'rpg/farm' => 'rpg#farm'
  post 'rpg/cave' => 'rpg#cave'
  post 'rpg/casino' => 'rpg#casino'
  post 'rpg/house' => 'rpg#house'
  post 'rpg/clear' => 'rpg#clear'
  root 'rpg#index'
end
