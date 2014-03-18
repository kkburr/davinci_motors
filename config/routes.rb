DavinciMotors::Application.routes.draw do
  root :to => "cars#index"
  resources :users, only: [:new, :create]
  resources :cars

  get 'login',
    to: 'sessions#login', #goes here b/c going to use sessions controllers
    as: 'login'

  post 'login',
    to: 'sessions#create' #uses same login path as get 'login', so we borrow from that.

  delete 'logout',
    to: 'sessions#destroy'
end
