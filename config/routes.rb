Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  post 'cart/create_charge' => 'carts#create_charge', :as => :create_charge
  post '/cart/create_address' => 'carts#create_address', :as => :create_address
  get '/cart/place_order' => 'carts#place_order', :as => :place_order
  get '/cart/checkout' => 'carts#checkout', :as => :checkout
  get '/cart' => 'carts#index'
  get '/cart/clear' => 'carts#clear'
  get '/cart/remove/:id' => 'carts#remove'
  post '/cart/:id' => 'carts#add' # dodaje u korpu i ostaje na trenutnom proizvodu
  #promijeniti u post i napraviti formu koja ce submitati odabrane velicine
  #button plati odmah raditi kao get i preko JS onClick button apendati url ?product_id?quantity...
  get '/cart/pay' => 'carts#pay'
  post '/categories/:id' => 'categories#show'

  get 'account_activations/edit'
  root 'products#index'
  get 'home/index'
  get  '/signup' => 'users#new'
  get  '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/categories/new' => 'categories#new'
  post '/categories/new' => 'categories#create'

  get 'admin' => 'admins#index'
  get 'admin/categories' => 'admins#categories'
  get 'admin/products' => 'admins#products'
  get 'admin/sizes' => 'admins#sizes'
  get 'admin/colors' => 'admins#colors'
  get 'admin/brands' => 'admins#brands'
  get 'admin/users' => 'admins#users'

  resources :users 
  #resources :admins
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :products do
      resources :variants
  end
  resources :categories
  resources :colors
  resources :brands
  resources :sizes

end
