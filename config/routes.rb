# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users

  root 'home#homepage'

  resources :home, only: :index do
    get :homepage, on: :collection
  end
  resources :projects, only: [:index, :show]

  namespace :admin do
    root 'home#index'

    resources :home, only: [:index]

    resources :users
    resources :static_pages
    resources :projects do
      get :search, on: :collection
    end
    resources :pictures do
      post :sort, on: :collection
    end
    resources :tags
  end
end
