Rails.application.routes.draw do
  root :to => "products#index"

  resources :products do
    resources :order_items
  end
end
