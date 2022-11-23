Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'categories/index'
  get 'categories/show'
  get 'products/index'
  get 'products/show'
  root to: "home#index"

  get 'home/index'
  get 'product/index'
  get 'product/show'
  get 'category/index'
  get 'category/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :categories, only: [:index, :show]
  resources :products, only: [:index, :show] do
    collection do
      get "search"
    end
  end
  resources :cart, only: [:create, :destroy]
end
