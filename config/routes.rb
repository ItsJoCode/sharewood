Rails.application.routes.draw do
  devise_for :users
  root to: "sales#index"
  resources :products, only: %i[show]
  resources :sales, only: %i[index show]

  namespace :customer do
    resources :sales, only: %i[index show] do
      resources :orders, only: %i[create]
    end
    resources :orders, only: %i[index show]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
