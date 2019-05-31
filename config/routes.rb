# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'search/index'
  get 'search' => 'search#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    authenticated :user do
      root to: 'posts#index', as: :authenticated_root
    end
    unauthenticated :user do
      root to: 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  resources :posts do
    resources :comments
  end

  # resources :users

  # get "/signup", to: 'users#new'
  # get "/login", to: "sessions#new"
  # post "/login", to: "sessions#create"
  # delete "/logout", to: "sessions#destroy"
end
