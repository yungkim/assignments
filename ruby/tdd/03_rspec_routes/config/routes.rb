Rails.application.routes.draw do
  root 'dojos#index'
  get 'hello' => 'dojos#world'
  get 'ninjas' => 'dojos#ninjas'
end
