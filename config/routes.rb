Rails.application.routes.draw do
  root to: "users#index"

  devise_for :users

  resources :users, only: [:index] do
    collection do
      get :search
    end
  end
  resources :categories, only: [:index, :show]
end
