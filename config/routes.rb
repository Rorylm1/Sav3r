Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :items
  resources :baskets, only: [:show] do
    resources :items, only: [:index] do
        resources :order_histories, only: [:create]
    end
  end

  resources :favourites, only: [:index]
  # Defines the root path route ("/")
  # root "articles#index"
end
