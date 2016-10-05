Rails.application.routes.draw do

  get 'account_activations/edit'

  root 'home#index'
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
