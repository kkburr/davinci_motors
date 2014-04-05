DavinciMotors::Application.routes.draw do
  root :to => "cars#index"
  resources :users, only: [:new, :create]
  resources :cars do
    member do
      #get '/cars/:id/claim', to: 'cars#claim'
      get 'claim', as: 'claim'
      get 'unclaim', as: 'unclaim'
    end

    # collection do
    # ...
    # end
  end

  get 'my_cars', to: 'cars#my_cars'

  get 'login',
    to: 'sessions#login', #goes here b/c going to use sessions controllers
    as: 'login'

  post 'login',
    to: 'sessions#create' #This is a pretty bare branch, but it uses same login path
  # as get 'login', so we borrow from that.

  delete 'logout',
    to: 'sessions#destroy'

  get '/auth/:provider/callback', to: 'sessions#oauth'
end
