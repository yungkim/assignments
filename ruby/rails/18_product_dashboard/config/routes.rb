Rails.application.routes.draw do
    post 'products/create'
    resources :products
end
