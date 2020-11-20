Rails.application.routes.draw do
  devise_for :users
  # get 'items/index'
  # get 'items/new'
  root to: 'items#index'
  resources :items do
    resources  :orders
  end
end
