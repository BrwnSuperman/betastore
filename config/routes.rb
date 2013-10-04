Betastore::Application.routes.draw do
  get '/log_in'  => 'log_ins#new', as: 'log_in'
  post '/log_in'  => 'log_ins#create'
  post '/log_out' => 'log_ins#destroy', as: 'log_out'
  resources :products, :subscriptions
  root :to => 'products#index'

end
