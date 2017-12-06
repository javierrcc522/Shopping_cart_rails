Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :charges, only: [:new, :create]
  get 'charges/new'

  get 'charges/create'

  get 'thanks', to: 'charges#thanks', as: 'thanks'

  devise_for :users

  root :to => 'products#index'

  resources :products, only: [:index]
  resources :order_items
  resource :cart, only: [:show]
end
