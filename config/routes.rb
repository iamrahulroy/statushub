Rails.application.routes.draw do
  root to: "users#index"

  devise_for :users

  resources :users, only: [:index]
  resources :categories, only: [:index, :show]
end
