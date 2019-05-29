# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :posts
  # resources :users

  # get "/signup", to: 'users#new'
  # get "/login", to: "sessions#new"
  # post "/login", to: "sessions#create"
  # delete "/logout", to: "sessions#destroy"
end
