Rails.application.routes.draw do
  devise_for :users
  root to: "sales#index"
  namespace :owner do
    resources :products, only: %i[index show new create]
  end
  resources :products, only: %i[show]
  resources :sales, only: %i[index show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
