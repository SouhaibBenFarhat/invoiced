Rails.application.routes.draw do
  # devise_for :users
  namespace :v1, defaults: {format: :json} do
    resources :products, only: [:index, :create, :show]
    resources :contacts
    resources :sessions, only: [:create, :destroy]
    resources :users, only: [:create, :index, :show]
  end
end
