Rails.application.routes.draw do

  post 'cart/create_charge' => 'carts#create_charge', :as => :create_charge
  post '/cart/create_address' => 'carts#create_address', :as => :create_address
  get '/cart/place_order' => 'carts#place_order', :as => :place_order
  get '/cart/checkout' => 'carts#checkout', :as => :checkout
  get '/cart' => 'carts#index'
  get '/cart/clear' => 'carts#clear'
  get '/cart/remove/:id' => 'carts#remove'
  post '/cart/:id' => 'carts#add' #promijeniti u post i napraviti formu koja ce submitati odabrane velicine
  #button plati odmah raditi kao get i preko JS onClick button apendati url ?product_id?quantity...
  get '/cart/pay' => 'carts#pay'

  get 'account_activations/edit'
  root 'products#index'
  get 'home/index'
  get  '/signup' => 'users#new'
  get  '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :users 
  resources :account_activations, only: [:edit]
  resources :products do
      resources :variants
  end
  resources :categories
  resources :colors
  resources :brands
  resources :sizes

end
