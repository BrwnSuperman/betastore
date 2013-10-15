Betastore::Application.routes.draw do
  namespace :admin do
    resources:products
  end

  resources :products
  root :to => 'products#index'

  resources :subscriptions

  get '/log_in'  => 'log_ins#index', as: 'log_in'
  get '/log_in'  => 'log_ins#new'
  post '/log_in'  => 'log_ins#create'
  post '/log_out' => 'log_ins#destroy', as: 'log_out'

  get '/sign_up' => 'customers#new', as: 'sign_up'
  post '/sign_up' => 'customers#create'

end