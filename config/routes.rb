Rails.application.routes.draw do

  get '/cart' => 'carts#index'
  get '/cart/clear' => 'carts#clear'
  get '/cart/:id' => 'carts#add'

  get 'account_activations/edit'

  root 'products#index'
  get 'home/index'
  get  '/signup' => 'users#new'
  get  '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :users 
  resources :account_activations, only: [:edit]
  resources :products
  resources :categories
  resources :colors
  resources :brands
  resources :sizes

end
