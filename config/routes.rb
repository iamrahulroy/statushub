Rails.application.routes.draw do
  root to: "users#index"

  devise_for :users

  resources :users, only: [:index, :show] do
    collection do
      get :search
    end
  end
  resources :categories, only: [:show]
  resources :user_favorites, only: [:create, :destroy, :index]
end
