Rails.application.routes.draw do
  devise_for :users
  root to: "projects#index"
  resources :users, only: [:edit, :update, :show]
  resources :projects, only: [:new, :create, :show] do
    resources :tasks, only: [:index, :new, :create]
    resources :donations, only: [:index, :create]
    resources :rooms, only: [:index, :new, :create, :destroy] do
      resources :messages, only: [:index, :create]
    end
  end
end

