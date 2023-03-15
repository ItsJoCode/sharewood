Rails.application.routes.draw do
  get 'reviews/index'
  get 'reviews/show'
  get 'reviews/create'
  devise_for :users
  root to: "sales#index"
  get '/home', to: 'pages#home'
  get '/a-propos-des-pellets', to: 'pages#propos_pellet'
  get '/cgv', to: 'pages#cgv'
  get '/informations_personnelles', to: 'pages#informations_personnelles'
  get '/cookies_policy', to: 'pages#cookies_policy'

  namespace :owner do
    resources :products, only: %i[index show new create] do
      resources :sales, only: %i[new create]
    end
    resources :sales, only: %i[index show update]
  end

  namespace :customer do
    resources :sales, only: %i[index show] do
      resources :orders, only: %i[create]
    end
    resources :orders, only: %i[index show] do
      resources :reviews, only: %i[create]
    end
  end

  resources :creators, only: %i[index show]
  resources :products, only: %i[show]
  resources :sales, only: %i[index show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
