Rails.application.routes.draw do
  devise_for :users

  root 'home#index'
  # root 'home#homepage' # uncomment when page is going live:)

  resources :home, only: :index do
    get :homepage, on: :collection
  end

  resources :projects, only: [:index, :show]
  resources :static_pages, only: :show

  namespace :admin do
    root 'home#index'

    resources :home, only: [:index]

    resources :users
    resources :static_pages
    resources :projects
    resources :tags
  end
end
