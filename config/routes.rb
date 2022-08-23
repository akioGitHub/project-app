Rails.application.routes.draw do
  devise_for :users
  # get 'projects/index'
  root to: "projects#index"
  resources :users, only: [:edit, :update, :show]
  resources :projects, only: [:new, :create, :show] do
    resources :donations, only: [:index, :create]
    resources :rooms, only: [:new, :create, :destroy] do
      resources :messages, only: [:index, :create]
    end
  end
end

