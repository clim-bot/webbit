Rails.application.routes.draw do
  get "profiles/show"
  resources :communities

  resources :submissions do
    resources :comments
  end

  devise_for :users
  root "submissions#index"

  resources :profiles, only: [ :show ]
end
