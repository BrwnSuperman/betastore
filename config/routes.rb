Betastore::Application.routes.draw do
  resources :products
  root :to => 'products#index'

  resources :subscriptions