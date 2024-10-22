require "sidekiq/web"

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  resources :communities do
    resources :subscriptions
  end

  resources :submissions do
    member do
      put "upvote", to: "submissions#upvote"
      put "downvote", to: "submissions#downvote"
    end

    resources :comments do
      member do
        put "upvote", to: "comments#upvote"
        put "downvote", to: "comments#downvote"
      end
    end
  end

  get "submissions/unsubscribe/:unsubscribe_hash" => "submissions#unsubscribe", as: :comment_unsubscribe

  devise_for :users
  root "submissions#index"

  resources :profiles, only: [ :show ]
end
