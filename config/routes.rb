Rails.application.routes.draw do

  resources :users do
  	member do
  		get :confirm_email
  	end
  end

  root 'home#index'
  
  get 'home/index'
  get  '/signup' => 'users#new'

end
