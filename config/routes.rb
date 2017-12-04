Rails.application.routes.draw do
  resources :charges, only: [:new, :create]
  get 'charges/new'

  get 'charges/create'

  devise_for :users

  root :to => 'products#index'

  resources :products
  resources :order_items
  resource :cart, only: [:show]



end
