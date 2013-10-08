Betastore::Application.routes.draw do

  resources :products, only: [:index] do
    resources :orders, only: [:new, :create, :update, :delete, :index] do
      resources :refunds, only [:index, :new, :create]
    end
  end
  resources :subscriptions
  root :to => 'products#index'
  get '/log_in'  => 'log_ins#new', as: 'log_in'
  post '/log_in'  => 'log_ins#create'
  post '/log_out' => 'log_ins#destroy', as: 'log_out'

end
