Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',
                 registration: 'signup'
             },
             controllers: {
                 sessions: 'v1/sessions',
                 registrations: 'v1/registrations'
             }
  namespace :v1, defaults: {format: :json} do
    resources :products, only: [:index, :create, :show]
    resources :contacts
    resources :sessions, only: [:create, :destroy]
    resources :users, only: [:create, :index, :show]
  end
end
