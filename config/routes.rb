Rails.application.routes.draw do
  devise_for :users
  get 'projects/index'
  root to: "projects#index"
  resources :users, only: [:edit, :update, :show]
end
