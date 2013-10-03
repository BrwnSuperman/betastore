Betastore::Application.routes.draw do
  resources :products, :subscriptions
  root :to => 'products#index'
end
