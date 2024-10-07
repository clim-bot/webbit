Rails.application.routes.draw do
  resources :communities

  resources :submissions do
    resources :comments
  end

  devise_for :users
  root "submissions#index"
end
