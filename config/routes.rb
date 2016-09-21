Rails.application.routes.draw do
  resources :users

  root 'home#index'
  
  get 'home/index'
  get  '/signup' => 'users#new'
  
end
