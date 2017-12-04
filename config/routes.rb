Rails.application.routes.draw do
  devise_for :users

  root :to => 'products#index'

  resources :products
  
  resources :order_items


  resource :cart, only: [:show]

end
