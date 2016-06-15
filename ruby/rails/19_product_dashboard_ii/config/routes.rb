Rails.application.routes.draw do
    get 'comments/' => 'comments#index'
    post 'comments/create'
    delete 'comments/:id' => 'comments#destroy'
    post 'products/create'
    resources :products
end
